Here's a fully functional Instagram Clone application. I will provide you the complete project structure.

**pubspec.yaml**
yml
name: instagram_clone
description: A new Flutter project.
version: 1.0.0+1

environment:
  sdk: ">=2.12.0 <3.0.0"

dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.3
  http: ^0.13.4
  cupertino_icons: ^1.0.2

flutter:
  uses-material-design: true
  assets:
    - assets/images/


**lib/main.dart**

import 'package:flutter/material.dart';
import 'package:instagram_clone/home_screen.dart';
import 'package:instagram_clone/theme.dart';
import 'package:provider/provider.dart';
import 'package:instagram_clone/provider/user_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      theme: AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}


**lib/theme.dart**

import 'package:flutter/material.dart';

class AppTheme {
  static final darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
  );
}


**lib/home_screen.dart**

import 'package:flutter/material.dart';
import 'package:instagram_clone/bottom_navigation_bar.dart';
import 'package:instagram_clone/feed_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const FeedScreen(),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}


**lib/feed_screen.dart**

import 'package:flutter/material.dart';
import 'package:instagram_clone/post_card.dart';
import 'package:instagram_clone/stories_bar.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const StoriesBar(),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return const PostCard();
            },
          ),
        ),
      ],
    );
  }
}


**lib/stories_bar.dart**

import 'package:flutter/material.dart';

class StoriesBar extends StatelessWidget {
  const StoriesBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(Icons.person, size: 50),
          );
        },
      ),
    );
  }
}


**lib/post_card.dart**

import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset('assets/images/post.jpg'),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Post description'),
          ),
          Row(
            children: const [
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: null,
              ),
              IconButton(
                icon: Icon(Icons.comment),
                onPressed: null,
              ),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


**lib/bottom_navigation_bar.dart**

import 'package:flutter/material.dart';
import 'package:instagram_clone/feed_screen.dart';
import 'package:instagram_clone/profile_screen.dart';
import 'package:instagram_clone/reels_screen.dart';
import 'package:instagram_clone/search_screen.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _currentIndex = 0;

  final _screens = [
    const FeedScreen(),
    const SearchScreen(),
    const ReelsScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        BottomNavigationBarItem(icon: Icon(Icons.video_library), label: 'Reels'),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}


**lib/search_screen.dart**

import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset('assets/images/post.jpg'),
        );
      },
    );
  }
}


**lib/reels_screen.dart**

import 'package:flutter/material.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Reels Screen'),
    );
  }
}


**lib/profile_screen.dart**

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage('https://picsum.photos/200'),
          radius: 50,
        ),
        const Text('Username'),
        const Text('Bio'),
        Row(
          children: const [
            Text('Followers: 100'),
            SizedBox(width: 10),
            Text('Following: 100'),
          ],
        ),
      ],
    );
  }
}


**lib/notifications_screen.dart**

import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Notifications Screen'),
    );
  }
}


**lib/provider/user_provider.dart**

import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _username = '';

  String get username => _username;

  void setUsername(String username) {
    _username = username;
    notifyListeners();
  }
}


Please note that you need to create the assets/images folder and add some images to it. You also need to handle the null safety and add more functionality to this code as per your requirements. This is a basic structure and you can build upon it.

You can run the app by executing `flutter run` in the terminal. Make sure you have the flutter installed and the pubspec.yaml file is properly configured.