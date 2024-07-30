import 'package:flutter/material.dart';
import 'package:new_sironi/beverage.dart';
import 'package:new_sironi/food.dart';
import 'package:new_sironi/homepage.dart'; // Ensure this import points to the correct file
import 'package:url_launcher/url_launcher.dart'; // Import the url_launcher package

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 26, 94, 172),
        title: const Text(
          "Contact Us",
          style: TextStyle(
            fontFamily: 'Genty',
            fontSize: 25,
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Center(
                  child: ClipOval(
                    child: Container(
                      width: 150,
                      height: 150,
                      color: Colors.transparent,
                      child: Image.asset('images/logo.gif'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 250, // Set the desired width
                height: 80, // Set the desired height
                child: FloatingActionButton(
                  onPressed: () async {
                    final url = 'https://wa.me/0111488519?text=Hello';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      print('Could not launch $url');
                    }
                  },
                  child: Text(
                    "Our WhatsApp!",
                    style: TextStyle(
                      fontSize: 20, // Adjust text size if needed
                    ),
                  ),
                  backgroundColor: Color.fromARGB(255, 136, 208, 221),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
