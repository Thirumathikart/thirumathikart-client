import 'package:thirumathikart_app/config/themes.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBar(String label) => AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      'Sign-In',
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppTheme.textPrimary,
          fontSize: 25),
    ),
    centerTitle: true);
