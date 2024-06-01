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
      home: Photo(),
    );
  }
}

class Photo extends StatelessWidget {
  const Photo({super.key});
  final url = 'https://th.bing.com/th/id/R.10ddad628f46b4d79fccd1a049899ec1?rik=5hnZ6oFoGOn7eQ&riu=http%3a%2f%2fimages.unsplash.com%2fphoto-1566264956500-0549ed17e161%3fixlib%3drb-1.2.1%26q%3d80%26fm%3djpg%26crop%3dentropy%26cs%3dtinysrgb%26w%3d1080%26fit%3dmax%26ixid%3deyJhcHBfaWQiOjEyMDd9&ehk=Eq%2f3gtVGbPQAVHyWOxG%2b3tGILLT1DLgCih2a8FfZM74%3d&risl=&pid=ImgRaw&r=0';

  @override
  Widget build(BuildContext context) {
    return Image.network(url);
  }
}
