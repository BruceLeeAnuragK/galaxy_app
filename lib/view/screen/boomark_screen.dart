import 'package:flutter/material.dart';
import 'package:galaxy_app/provider/shared_preferences_provider.dart';
import 'package:provider/provider.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SharePrefProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.deepPurple,
            title: const Text(
              "Bookmark",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: provider.StroredPlanetsList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  provider.StroredPlanetsList[index].name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
