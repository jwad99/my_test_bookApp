import 'package:flutter/material.dart';
import 'package:reader_tracker/models/book.dart';
import 'package:reader_tracker/utils/bookDetailsArguments.dart';

class BooksDetailsScreen extends StatefulWidget {
  const BooksDetailsScreen({super.key});

  @override
  State<BooksDetailsScreen> createState() => _BooksDetailsScreenState();
}

class _BooksDetailsScreenState extends State<BooksDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as BookDetailsArguments;
    final Book book = args.itemBook;
    final txtTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              if (book.imageLinks.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Image.network(
                    book.imageLinks["thumbnail"] ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      book.title,
                      style: txtTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Text(book.authors.join(', & '), style: txtTheme.titleSmall),
                  Text(
                    "Published : ${book.publishedDate}",
                    style: txtTheme.bodySmall,
                  ),
                  Text(
                    "Page Count : ${book.pageCount}",
                    style: txtTheme.bodySmall,
                  ),
                  Text(
                    "Language : ${book.language}",
                    style: txtTheme.bodySmall,
                  ),
                ],
              ),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      label: Text("Save"),
                      icon: Icon(Icons.save),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      label: Text("Favorite"),
                      icon: Icon(Icons.favorite),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Description",
                  style: txtTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(
                    context,
                  ).colorScheme.secondary.withOpacity(0.1),
                ),
                child: Text(book.description),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
