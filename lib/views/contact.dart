import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:thirumathikart_app/views/home.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPage createState() => _ContactPage();
}

class _ContactPage extends State<ContactPage> {
  @override
  // ignore: prefer_expression_function_bodies
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => HomePage()))
          },
        ),
        title: const Text('Contact Us'),
        backgroundColor: Color.fromARGB(255, 65, 178, 69),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Lottie.asset(
                'assets/penguin.json',
                repeat: true,
                reverse: true,
                animate: true,
                height: 200,
                width: 300,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child:
                  Text('In case of any queries, feel free to\nreach us at:\n',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontStyle: FontStyle.italic,
                      )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Text('shgnitt@gmail.com\n+91-9677135980',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
