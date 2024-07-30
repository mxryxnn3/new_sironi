import 'package:flutter/material.dart';

class OurStory extends StatefulWidget {
  const OurStory({Key? key}) : super(key: key);

  @override
  State<OurStory> createState() => _OurStoryState();
}

class _OurStoryState extends State<OurStory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 26, 94, 172),
        title: const Text(
          "About Sironi",
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
              Padding(padding: EdgeInsets.all(10)),
              Image.asset(
                'images/os5.jpg',
                width: 400,
                height: 300,
                fit: BoxFit.cover,
              ),
              Divider(),
              SizedBox(height: 20),
              // Add your text box here
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: 400, // Adjust width as needed
                  height: 200, // Adjust height as needed
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SingleChildScrollView(
                      child: TextField(
                        maxLines: null, // Allows the text field to grow with content
                        decoration: InputDecoration.collapsed(
                          hintText: "Sironi, founded in 2010 by USIU alumni Luca and Isabella Sironi, blends Italian and American flavors. Located at USIU, this cozy restaurant offers classics like Margherita pizza and fusion dishes like Southern Fried Chicken Alfredo, and it offers delicious drinks such as ice coffee. Sironi is a beloved campus spot, known for its warm atmosphere and community events.",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
