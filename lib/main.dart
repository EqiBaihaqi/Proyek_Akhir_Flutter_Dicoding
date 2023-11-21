import 'package:codelab/main_screen.dart';
import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wisata Bandung'),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constrains) {
            if (constrains.maxWidth <= 600) {
              return const TourismPlaceList();
            } else if (constrains.maxWidth >= 600 &&
                constrains.maxWidth <= 1200) {
              return TourismPlaceGrid(gridCount: 4);
            } else {
              return TourismPlaceGrid(gridCount: 6);
            }
          },
        ),
      ),
    );
  }
}
