Here is the complete project structure for an Instagram Clone application in Flutter:

**pubspec.yaml**
yml
name: instagram_clone
description: Instagram Clone Application
version: 1.0.0+1

environment:
  sdk: ">=2.17.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.3
  http: ^0.13.5
  cupertino_icons: ^1.0.2
  cached_network_image: ^3.2.3
  flutter_secure_storage: ^6.0.0

dev_dependencies:
  flutter_test:
    sdk: flutter

flutter:
  uses-material-design: true
  assets:
    - assets/images/
    - assets/icons/


**assets/images/profile.jpg**
markdown
# Add a sample profile picture


**assets/icons/favicon.png**
markdown
# Add a sample favicon


**lib/main.dart**

import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:instagram_clone/routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Instagram Clone',
          theme: themeProvider.themeData,
          darkTheme: themeProvider.darkThemeData,
          themeMode: themeProvider.themeMode,
          initialRoute: '/',
          routes: routes,
        );
      },
    );
  }
}


**lib/routes.dart**

import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/home_screen.dart';
import 'package:instagram_clone/screens/profile_screen.dart';
import 'package:instagram_clone/screens/search_screen.dart';
import 'package:instagram_clone/screens/reels_screen.dart';
import 'package:instagram_clone/screens/notifications_screen.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => HomeScreen(),
  '/profile': (context) => ProfileScreen(),
  '/search': (context) => SearchScreen(),
  '/reels': (context) => ReelsScreen(),
  '/notifications': (context) => NotificationsScreen(),
};


**lib/providers/theme_provider.dart**

import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;

  ThemeData _themeData = ThemeData.light();
  ThemeData get themeData => _themeData;

  ThemeData _darkThemeData = ThemeData.dark();
  ThemeData get darkThemeData => _darkThemeData;

  void toggleThemeMode() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}


**lib/screens/home_screen.dart**

import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/stories_bar.dart';
import 'package:instagram_clone/widgets/post_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram Clone'),
      ),
      body: Column(
        children: [
          StoriesBar(),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return PostItem(
                  postId: index,
                  postImage: 'assets/images/post_image_$index.jpg',
                  postLikes: 100,
                  postComments: 50,
                  postShares: 20,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


**lib/screens/profile_screen.dart**

import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/profile_header.dart';
import 'package:instagram_clone/widgets/post_grid.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          ProfileHeader(
            profileImage: 'assets/images/profile.jpg',
            profileName: 'John Doe',
            profileBio: 'Software Engineer',
            profileFollowers: 1000,
            profileFollowing: 500,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 20,
              itemBuilder: (context, index) {
                return PostGridItem(
                  postImage: 'assets/images/post_image_$index.jpg',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


**lib/screens/search_screen.dart**

import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/search_grid.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: SearchGrid(),
    );
  }
}


**lib/screens/reels_screen.dart**

import 'package:flutter/material.dart';

class ReelsScreen extends StatefulWidget {
  @override
  _ReelsScreenState createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reels'),
      ),
      body: Center(
        child: Text('Reels Screen'),
      ),
    );
  }
}


**lib/screens/notifications_screen.dart**

import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Center(
        child: Text('Notifications Screen'),
      ),
    );
  }
}


**lib/widgets/stories_bar.dart**

import 'package:flutter/material.dart';

class StoriesBar extends StatefulWidget {
  @override
  _StoriesBarState createState() => _StoriesBarState();
}

class _StoriesBarState extends State<StoriesBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return StoryItem(
            storyImage: 'assets/images/story_image_$index.jpg',
          );
        },
      ),
    );
  }
}

class StoryItem extends StatelessWidget {
  final String storyImage;

  StoryItem({this.storyImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(storyImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}


**lib/widgets/post_item.dart**

import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final int postId;
  final String postImage;
  final int postLikes;
  final int postComments;
  final int postShares;

  PostItem({
    this.postId,
    this.postImage,
    this.postLikes,
    this.postComments,
    this.postShares,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Image.asset(postImage),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {},
              ),
              Text('$postLikes likes'),
              SizedBox(width: 10),
              IconButton(
                icon: Icon(Icons.comment),
                onPressed: () {},
              ),
              Text('$postComments comments'),
              SizedBox(width: 10),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {},
              ),
              Text('$postShares shares'),
            ],
          ),
        ],
      ),
    );
  }
}


**lib/widgets/profile_header.dart**

import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String profileImage;
  final String profileName;
  final String profileBio;
  final int profileFollowers;
  final int profileFollowing;

  ProfileHeader({
    this.profileImage,
    this.profileName,
    this.profileBio,
    this.profileFollowers,
    this.profileFollowing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(profileImage),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(profileName),
              Text(profileBio),
              Row(
                children: [
                  Text('$profileFollowers followers'),
                  SizedBox(width: 10),
                  Text('$profileFollowing following'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}


**lib/widgets/post_grid.dart**

import 'package:flutter/material.dart';

class PostGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return PostGridItem(
          postImage: 'assets/images/post_image_$index.jpg',
        );
      },
    );
  }
}

class PostGridItem extends StatelessWidget {
  final String postImage;

  PostGridItem({this.postImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Image.asset(postImage),
    );
  }
}


**lib/widgets/search_grid.dart**

import 'package:flutter/material.dart';

class SearchGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return SearchGridItem(
          mediaImage: 'assets/images/media_image_$index.jpg',
        );
      },
    );
  }
}

class SearchGridItem extends StatelessWidget {
  final String mediaImage;

  SearchGridItem({this.mediaImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Image.asset(mediaImage),
    );
  }
}

To run this project, you'll need to add the following packages to your `pubspec.yaml` file:
yml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.3
  http: ^0.13.5
  cupertino_icons: ^1.0.2
  cached_network_image: ^3.2.3
  flutter_secure_storage: ^6.0.0

You'll also need to run `flutter pub get` in your terminal to install the dependencies.
Remember to replace the placeholder images with your own images in the `assets/images` directory.

You can then run the app on an emulator or physical device using `flutter run`.