import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:new_sironi/menu.dart';
import 'package:new_sironi/ourstory.dart';
import 'package:new_sironi/reviews.dart';
import 'package:new_sironi/contactus.dart';
import 'package:new_sironi/my_orders.dart'; // Import the MyOrders screen
import 'package:new_sironi/login.dart'; // Import the Login screen

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Color.fromRGBO(107, 133, 219, 0.431),
        child: Column(
          children: [
            // Drawer header
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 26, 94, 172),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/logo.png'), // Profile or Logo image
                  ),
                  SizedBox(height: 10),
                  Text(
                    'SIRONI RESTAURANT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildListTile(Icons.account_circle_sharp, 'Order Now!', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Menu(),
                      ),
                    );
                  }),
                  _buildListTile(Icons.home, 'Our Story :)', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => OurStory(),
                      ),
                    );
                  }),
                  _buildListTile(Icons.sunny, 'Reviews', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Reviews(),
                      ),
                    );
                  }),
                  _buildListTile(Icons.yard_rounded, 'Contact Us', () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => ContactUs(),
                      ),
                    );
                  }),
                  _buildListTile(Icons.shopping_cart, 'My Orders', () { // Add My Orders navigation
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => MyOrders(),
                      ),
                    );
                  }),
                  SizedBox(height: 10), // Space before logout button
                  _buildListTile(Icons.logout, 'Logout', () { // Add Logout button
                    _logout(context);
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          'SIRONI RESTAURANT',
          style: TextStyle(
            fontFamily: 'Genty',
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 26, 94, 172),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: ClipOval(
                      child: Container(
                        width: 150,
                        height: 150,
                        color: Colors.transparent,
                        child: Image.asset(
                          'assets/images/logo.gif',
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Image.asset(
                    'assets/images/hp.gif',
                    width: 350,
                    height: 600,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Genty',
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      onTap: onTap,
    );
  }

  void _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    } catch (e) {
      // Handle error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout failed: ${e.toString()}'), backgroundColor: Colors.red),
      );
    }
  }
}
