import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Orders',
          style: TextStyle(
            fontFamily: 'Genty',
            fontSize: 25,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 26, 94, 172),
      ),
      body: user == null
          ? Center(child: Text('Please log in to view your orders.'))
          : StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('orders')
                  .where('userId', isEqualTo: user.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final orders = snapshot.data!.docs;
                if (orders.isEmpty) {
                  return Center(child: Text('You have no orders.'));
                }

                return ListView.builder(
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    final order = orders[index];
                    final quantity = order['quantity'];
                    final foodId = order['foodId'];

                    return FutureBuilder<DocumentSnapshot>(
                      future: FirebaseFirestore.instance
                          .collection('food')
                          .doc(foodId)
                          .get(),
                      builder: (context, foodSnapshot) {
                        if (!foodSnapshot.hasData) {
                          return ListTile(
                            title: Text('Loading...'),
                          );
                        }

                        final food = foodSnapshot.data!;
                        final foodName = food['name'];
                        final foodImage = food['image'];

                        return ListTile(
                          leading: Image.asset(
                            foodImage ?? 'assets/images/placeholder.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(foodName),
                          subtitle: Text('Quantity: $quantity'),
                        );
                      },
                    );
                  },
                );
              },
            ),
    );
  }
}
