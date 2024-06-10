import 'package:animation_demo/spotify/playlist_model.dart';
import 'package:flutter/material.dart';
import 'widget/playlist_grid_item.dart';
import 'widget/playlist_item.dart';
import 'widget/section_header.dart';

class HomeScreen extends StatelessWidget {
  final List<Playlist> morningPlaylists = [
    Playlist(
      title: "Today's Top Hits",
      description: "",
      imageUrl: "lib/assets/1.png",
    ),
    Playlist(
      title: "Daily Mix 1",
      description: "",
      imageUrl: "lib/assets/2.png",
    ),
    Playlist(
      title: "Daily Mix 2",
      description: "",
      imageUrl: "lib/assets/3.png",
    ),
    Playlist(
      title: "Discover Weekly",
      description: "",
      imageUrl: "lib/assets/4.png",
    ),
    Playlist(
      title: "Release Radar",
      description: "",
      imageUrl: "lib/assets/5.png",
    ),
    Playlist(
      title: "Tastebreakers",
      description: "",
      imageUrl: "lib/assets/6.png",
    ),
  ];

  final List<Playlist> madeForYou = [
    Playlist(
      title: "On Repeat",
      description: "The songs you can't get enough of right now.",
      imageUrl: "lib/assets/1.png",
    ),
    Playlist(
      title: "Your Discover Weekly",
      description: "Your weekly mixtape of fresh music.",
      imageUrl: "lib/assets/2.png",
    ),
  ];

  final List<Playlist> popularPlaylists = [
    Playlist(
      title: "Feelin' Good",
      description: "",
      imageUrl: "lib/assets/3.png",
    ),
    Playlist(
      title: "Pumped Pop",
      description: "",
      imageUrl: "lib/assets/4.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          _getAppBarTitle(),
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.5,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: morningPlaylists.length,
              itemBuilder: (context, index) {
                return PlaylistGridItem(playlist: morningPlaylists[index]);
              },
            ),
            const SizedBox(height: 20),
            SectionHeader(title: 'Made For You'),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: madeForYou.asMap().entries.map((entry) {
                    final index = entry.key;
                    final playlist = entry.value;
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: PlaylistItem(playlist: playlist, index: index),
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SectionHeader(title: 'Popular playlists'),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: popularPlaylists.asMap().entries.map((entry) {
                    final index = entry.key;
                    final playlist = entry.value;
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: PlaylistItem(playlist: playlist, index: index),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff121212),
        unselectedItemColor: Colors.white70,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Your Library',
          ),
        ],
      ),
    );
  }

  String _getAppBarTitle() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 18) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
}
