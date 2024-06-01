import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Gallery App',
      home: Gallery(
        title: 'Haseeb Gallery',
        urls: [
          'https://th.bing.com/th/id/OIP.XzP-5z-2nZq0cqQFAxtFLgHaEo?w=235&h=180&c=7&r=0&o=5&pid=1.7',
          'https://th.bing.com/th/id/OIP.XzP-5z-2nZq0cqQFAxtFLgHaEo?w=235&h=180&c=7&r=0&o=5&pid=1.7',
          'https://th.bing.com/th/id/OIP.6p_Z1fMuoTD0nrKR5ex0hAHaFj?w=234&h=180&c=7&r=0&o=5&pid=1.7',
          'https://th.bing.com/th/id/OIP.MPUscXSAaYFkP6xqB6sl4AHaE7?w=247&h=180&c=7&r=0&o=5&pid=1.7',
        ],
      ),
    );
  }
}

class Gallery extends StatelessWidget {
  const Gallery({super.key, required this.title, required this.urls});
  final List<String> urls;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GridView.count(
        primary: false,
        crossAxisCount: 2,
        children: List.of(
          urls.map((e) => Photo(url: e)),
        ),
      ),
    );
  }
}

//demo of injecting the state into the widget

class Photo extends StatelessWidget {
  const Photo({super.key, required this.url});
  final url;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Image.network(url),
    );
  }
}
