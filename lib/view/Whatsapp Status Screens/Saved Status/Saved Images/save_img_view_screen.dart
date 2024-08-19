import 'dart:io';
import 'package:flutter/material.dart';

class SavedStatusImageViewScreen extends StatefulWidget {
  final String? imagePath;
  const SavedStatusImageViewScreen({super.key, this.imagePath});

  @override
  State<SavedStatusImageViewScreen> createState() => _SavedStatusImageViewScreenState();
}

class _SavedStatusImageViewScreenState extends State<SavedStatusImageViewScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: FileImage(
              File(widget.imagePath!),
            ),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}