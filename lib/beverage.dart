import 'package:flutter/material.dart';

class Beverages extends StatefulWidget {
  const Beverages({Key? key}) : super(key: key);

  @override
  State<Beverages> createState() => _BeveragesState();
}

class _BeveragesState extends State<Beverages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 26, 94, 172),
        title: const Text(
          "Beverage Selection",
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
                'images/coffee.png',
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
                  height: 50, // Adjust height as needed
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
                          hintText: "Classic Sironi Hot Chocolate @Ksh.1000",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Duplicate entry removed
              Padding(padding: EdgeInsets.all(10)),
              Image.asset(
                'images/frap.png',
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
                  height: 50, // Adjust height as needed
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
                          hintText: "Classic Sironi Irish Cream Cold Brew @Ksh.2500",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Image.asset(
                'images/iced.png',
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
                  height: 50, // Adjust height as needed
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
                          hintText: "Classic Sironi  @Ksh.1000",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Image.asset(
                'images/milkshake.png',
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
                  height: 50, // Adjust height as needed
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
                          hintText: "Classic Sironi Frap @Ksh.1000",
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
