import 'package:thirumathikart_app/config/themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget signIn() => Padding(
    padding: const EdgeInsets.all(30),
    child: Column(children: [
      const SizedBox(height: 10),
      Column(
        children: [
          signInButton(FontAwesomeIcons.google, 'Login', AppTheme.google),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Text('----- OR -----',
                  style: TextStyle(fontSize: 18, color: AppTheme.chakra))),
          signInButton(FontAwesomeIcons.facebook, 'Register', AppTheme.facebook)
        ],
      )
    ]));

Widget signInButton(IconData icon, String label, Color color) => Padding(
    padding: const EdgeInsets.all(10),
    child: Material(
        elevation: 20,
        color: Colors.transparent,
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            alignment: Alignment.center,
            width: 225,
            decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Text(
              label,
              style: TextStyle(color: AppTheme.textSecondary),
            ))));
