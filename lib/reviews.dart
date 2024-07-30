import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Reviews extends StatefulWidget {
  const Reviews({Key? key}) : super(key: key);

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  final TextEditingController reviewController = TextEditingController();

  Future<void> _submitReview() async {
    if (reviewController.text.isEmpty) return;

    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await FirebaseFirestore.instance.collection('reviews').add({
          'review': reviewController.text,
          'userId': user.uid,
          'timestamp': FieldValue.serverTimestamp(),
        });
        reviewController.clear();
      }
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 26, 94, 172),
        title: const Text(
          "Reviews",
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
              TextField(
                controller: reviewController,
                decoration: InputDecoration(
                  hintText: "Write a review",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.comment),
                ),
              ),
              SizedBox(height: 15),
              FloatingActionButton(
                onPressed: _submitReview,
                child: Text("Submit Review"),
                backgroundColor: Color.fromARGB(255, 136, 208, 221),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
