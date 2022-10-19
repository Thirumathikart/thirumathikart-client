import 'package:thirumathikart_app/models/textfield.dart';
import 'package:flutter/material.dart';

List<TextValues> values = [
  TextValues(
      hintword: 'First Name', texttype: TextInputType.name, istrue: false),
  TextValues(
      hintword: 'Last Name', texttype: TextInputType.name, istrue: false),
  TextValues(
      hintword: 'Enter Email',
      texttype: TextInputType.emailAddress,
      istrue: false),
  TextValues(
      hintword: 'Enter Password',
      texttype: TextInputType.visiblePassword,
      istrue: true),
  TextValues(
      hintword: 'Reenter Password',
      texttype: TextInputType.visiblePassword,
      istrue: true),
];
