import 'package:flutter/material.dart';
import 'package:spotify/model/playlist_model.dart';
import 'package:spotify/pages/playlist_detail_page.dart';

class PlaylistGridItem extends StatelessWidget {
  final Playlist playlist;

  PlaylistGridItem({required this.playlist});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaylistDetailScreen(playlist: playlist),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(2),
        ),
        child: Row(
          children: [
            Hero(
                tag: 'playlist-${playlist.title}',
                child: Image(
                  image: AssetImage(playlist.imageUrl),
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )
                // Image.network(
                //   playlist.imageUrl,
                //   width: 50,
                //   height: 50,
                //   fit: BoxFit.cover,
                // ),
                ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                playlist.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
