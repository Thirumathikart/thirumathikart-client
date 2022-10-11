import 'package:thirumathikart_app/config/themes.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBar(String label) => AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: AppTheme.textPrimary),
    title: Text(
      label,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppTheme.textPrimary,
          fontSize: 22),
    ),
    centerTitle: true);
