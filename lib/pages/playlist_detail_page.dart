import 'package:flutter/material.dart';
import 'package:spotify/model/playlist_model.dart';

class PlaylistDetailScreen extends StatelessWidget {
  final Playlist playlist;

  PlaylistDetailScreen({required this.playlist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      appBar: AppBar(
        backgroundColor: const Color(0xff121212),
        elevation: 0,
        title: Text(
          playlist.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9, // Set aspect ratio for the image
            child: Hero(
                tag: 'playlist-${playlist.title}',
                child: Image(
                  image: AssetImage(playlist.imageUrl),
                  fit: BoxFit.cover,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              playlist.description,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white, // Set text color to white
              ),
            ),
          ),
          // Add more details here
        ],
      ),
    );
  }
}
