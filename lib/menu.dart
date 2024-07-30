import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController _orderController = TextEditingController();
  final User? _user = FirebaseAuth.instance.currentUser; // Get current user

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600; // Define what you consider as a large screen

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu',
          style: TextStyle(
            fontFamily: 'Genty',
            fontSize: 25,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 26, 94, 172),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('food').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          final foods = snapshot.data!.docs;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isLargeScreen ? 3 : 1, // Adjust number of columns based on screen size
              childAspectRatio: isLargeScreen ? 1.5 : 1, // Adjust aspect ratio for better fit
            ),
            itemCount: foods.length,
            itemBuilder: (context, index) {
              final food = foods[index];
              final foodName = food['name'];
              final imagePath = food['image']; // Assuming image path is stored in 'image'

              return Card(
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Expanded(
                      child: imagePath != null
                          ? Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/images/placeholder.png', // Placeholder image if no path found
                              fit: BoxFit.cover,
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        foodName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(
                        food['description'],
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _showOrderDialog(food.id),
                      child: Text('Order'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showOrderDialog(String foodId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Place Order'),
          content: TextField(
            controller: _orderController,
            decoration: InputDecoration(
              hintText: 'Enter quantity',
            ),
            keyboardType: TextInputType.number,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _placeOrder(foodId, _orderController.text);
              },
              child: Text('Submit'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _placeOrder(String foodId, String quantity) async {
    if (_user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please log in to place an order.')),
      );
      return;
    }

    await _firestore.collection('orders').add({
      'foodId': foodId,
      'quantity': quantity,
      'timestamp': FieldValue.serverTimestamp(),
      'userId': _user!.uid, // Add the user's ID to the order
    });
    _orderController.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Order placed successfully!')),
    );
  }
}
