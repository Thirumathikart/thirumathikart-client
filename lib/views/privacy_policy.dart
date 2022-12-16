import 'package:flutter/material.dart';
import 'package:thirumathikart_app/constants/privacy_constants.dart';
import 'package:thirumathikart_app/widgets/app_bar.dart';

class Privacypage extends StatelessWidget {
  const Privacypage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(Privacypolicy.privacy),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Text(
                Privacypolicy.privacy,
                style: const TextStyle(
                    height: 3, fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Privacypolicy.privacycontent,
                  style: const TextStyle(height: 1.5, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
}
