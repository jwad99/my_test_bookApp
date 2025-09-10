import 'package:flutter/material.dart';
import 'package:reader_tracker/pages/books_details.dart';
import 'package:reader_tracker/pages/favorites_screen.dart';
import 'package:reader_tracker/pages/home_screen.dart';
import 'package:reader_tracker/pages/saved_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
      ),
      initialRoute: '/',
      routes: {
        '/home': (context) => HomeScreen(),
        '/saved': (context) => SavedScreen(),
        '/favorites': (context) => FavoritesScreen(),
        '/detailes': (context) => BookDetailsScreen(),
      },
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    SavedScreen(),
    FavoritesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Theme.of(context).copyWith().colorScheme.inversePrimary,
        title: Text("A.Reader"),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor:
            Theme.of(context).copyWith().colorScheme.inversePrimary,
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
          print(_currentIndex);
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.save), label: "Save"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
