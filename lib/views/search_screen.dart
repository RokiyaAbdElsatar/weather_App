import 'package:flutter/material.dart';
import 'package:weather_app/views/city_screen.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: const Text('Search City'),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              hintText: 'Search for a city...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // Implement search functionality here
                  // String cityName = searchController.text;
                  final cityName = searchController.text.trim();
                  if (cityName.isNotEmpty) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => CityScreen(cityName: cityName),
                    ));
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
