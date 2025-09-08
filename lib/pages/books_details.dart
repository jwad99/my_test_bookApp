import 'package:flutter/material.dart';

class BooksDetailsScreen extends StatefulWidget {
  const BooksDetailsScreen({super.key});

  @override
  State<BooksDetailsScreen> createState() => _BooksDetailsScreenState();
}

class _BooksDetailsScreenState extends State<BooksDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Book Details")));
  }
}
