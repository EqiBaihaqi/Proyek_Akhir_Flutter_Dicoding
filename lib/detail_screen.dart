import 'package:codelab/tourism_list/tourism_place.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final TourismPlace place;
  const DetailScreen({super.key, required this.place});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text(
          'Wisata Bandung',
          style: TextStyle(fontFamily: 'Baloo', fontSize: 40),
        )),
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 1200) {
            return WebView(place: place);
          } else {
            return MobileView(place: place);
          }
        }),
      ),
    );
  }
}

class MobileView extends StatelessWidget {
  const MobileView({
    super.key,
    required this.place,
  });

  final TourismPlace place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const FavoriteButton(),
            Image.asset(place.imageAsset),
            // ignore: avoid_unnecessary_containers
            Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Text(
                  place.name,
                  style: const TextStyle(
                      fontFamily: 'Baloo',
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )),
            SizedBox(
              child: Text(place.location, textAlign: TextAlign.center),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Icon(Icons.date_range),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(place.openDays)
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.lock_clock),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(place.openTime)
                    ],
                  ),
                  Column(
                    children: [
                      const Icon(Icons.money),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(place.ticketPrice)
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Text(
                place.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontFamily: 'Baloo', fontSize: 15),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WebView extends StatelessWidget {
  final TourismPlace place;
  const WebView({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
          child: Center(
            child: SizedBox(
              width: 1200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(place.imageAsset),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    place.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontFamily: 'Baloo',
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.date_range),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(place.openDays)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.lock_clock),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(place.openTime)
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.money),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(place.ticketPrice)
                                    ],
                                  ),
                                  const SizedBox(height: 14),
                                  Text(place.description)
                                ],
                              )
                            ],
                          ),
                        ),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: place.imageUrls.map((url) {
                        return Padding(
                          padding: const EdgeInsets.all(4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(url),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
    );
  }
}
