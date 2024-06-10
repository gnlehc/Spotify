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
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(8),
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
            SizedBox(width: 8),
            Expanded(
              child: Text(
                playlist.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
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
