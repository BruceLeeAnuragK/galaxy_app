import 'package:flutter/material.dart';
import 'package:galaxy_app/provider/planet_provider.dart';
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
              onPressed: () {
                setState(() {
                  Navigator.of(context).pop();
                });
              },
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
          body: (provider.StroredPlanetsList.isEmpty)
              ? const Center(
                  child: Text(
                    "No Bookmark Yet",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: provider.StroredPlanetsList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Text(
                          "${index + 1}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                        title: Text(
                          provider.StroredPlanetsList[index],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.deepPurple,
                          ),
                          onPressed: () {
                            provider.clearPlanet(
                                key: Provider.of<PlanetProvider>(context,
                                        listen: false)
                                    .key);
                            Provider.of<SharePrefProvider>(context,
                                    listen: false)
                                .StroredPlanetsList
                                .remove(Provider.of<SharePrefProvider>(context,
                                        listen: false)
                                    .storedPlanet);
                          },
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
