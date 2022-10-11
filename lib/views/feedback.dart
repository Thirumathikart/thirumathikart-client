import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thirumathikart_app/controllers/feedback_controller.dart';
import 'package:thirumathikart_app/views/home.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class FeedbackPage extends GetView<FeedbackController> {
  const FeedbackPage({super.key});
  final String name = '';
  final String message = '';
  final XFile? image = null;

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ThirumathiKart',
        home: Scaffold(
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
            title: const Text('Feedback'),
            backgroundColor: const Color.fromARGB(255, 73, 225, 31),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    child: Text(
                      'Leave a message for us',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextField(
                      onChanged: (val) {
                        //if (val != null || val.isNotEmpty) name = val;
                      },
                      decoration: InputDecoration(
                        fillColor: Color(0xffe6e6e6),
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                        hintText: 'Your name',
                        hintStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.001,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: TextField(
                      onChanged: (val) {
                        //if (val != null || val.isNotEmpty) message = val;
                      },
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        fillColor: Color(0xffe6e6e6),
                        filled: true,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 40, horizontal: 15),
                        hintText: 'Type your feedback',
                        hintStyle: TextStyle(
                          color: Colors.blueGrey,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(17),
                          ),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () async {
                          /*
                          ImagePicker picker = ImagePicker();
                          final img = await picker.pickImage(
                              source: ImageSource.gallery);
                          image = img;
                        */
                        },
                        label: const Text(
                          'Choose Image',
                        ),
                        icon: const Icon(Icons.image),
                      ),
                    ],
                  ),
                  if (image != null)
                    Image.file(File(image!.path), height: 150, width: 200)
                  else
                    const SizedBox(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Card(
                    color: Color.fromARGB(255, 65, 178, 69),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 50.0),
                    child: GestureDetector(
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                                child: Icon(
                              Icons.send,
                              color: Colors.white,
                            )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                            ),
                            Center(
                                child: Text(
                              'Send',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01,
                        left: 21,
                        right: 21,
                        bottom: MediaQuery.of(context).size.height * 0.03),
                    child: Text(
                      'Your system info and log data will be sent to ThirumathiKart',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'RobotoSlab',
                        color: Colors.blueGrey[600],
                        //fontSize: 10,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
