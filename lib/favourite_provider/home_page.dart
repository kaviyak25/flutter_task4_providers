import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import 'Favourite.dart';
import 'favourite_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final words = nouns.take(50).toList();
    final provider = FavoriteProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('English Words'),
      ),
      body: ListView.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          final word = words[index];
          return ListTile(
            title: Text(
              word,
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                provider.toggleFavorite(word);
              },
              icon: provider.isExist(word)
                  ? const Icon(Icons.favorite, color: Colors.red)
                  : const Icon(Icons.favorite_border),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          final route = MaterialPageRoute(
            builder: (context) => const FavoritePage(),
          );
          Navigator.push(context, route);
        },
        label: const Text('Favorites'),
      ),
    );
  }
}
