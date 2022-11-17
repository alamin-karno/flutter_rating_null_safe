import 'package:flutter/material.dart';
import 'package:flutter_rating_native/flutter_rating_native.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ratings',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Ratings'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double appRating = 3.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'App Rating: $appRating',
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 30),
          FlutterRating(
            size: 40,
            starCount: 5,
            rating: appRating,
            allowHalfRating: true,
            color: Colors.amber,
            borderColor: Colors.grey,
            mainAxisAlignment: MainAxisAlignment.center,
            onRatingChanged: (double rating) {
              setState(() {
                appRating = rating;
              });
            },
          ),
        ],
      ),
    );
  }
}
