import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2020 AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: const CreatorHomeScreen(),
    );
  }
}

class CreatorHomeScreen extends StatelessWidget {
  const CreatorHomeScreen({super.key});

  final List<Map<String, String>> platforms = const [
    {"title": "YouTube Creator", "icon": "▶️", "desc": "Long & Short viral ideas"},
    {"title": "Instagram Creator", "icon": "📸", "desc": "Reels & Engagement hooks"},
    {"title": "Facebook Creator", "icon": "📘", "desc": "Video & Post optimization"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2020 AI - Creator Suite', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Platform:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white70),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: platforms.length,
                itemBuilder: (context, index) {
                  final item = platforms[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E1E1E),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.deepPurple.withOpacity(0.4)),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: Text(item['icon']!, style: const TextStyle(fontSize: 36)),
                      title: Text(
                        item['title']!,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Text(item['desc']!, style: const TextStyle(color: Colors.grey)),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreatorGeneratorScreen(platformName: item['title']!),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreatorGeneratorScreen extends StatefulWidget {
  final String platformName;
  const CreatorGeneratorScreen({super.key, required this.platformName});

  @override
  State<CreatorGeneratorScreen> createState() => _CreatorGeneratorScreenState();
}

class _CreatorGeneratorScreenState extends State<CreatorGeneratorScreen> {
  final TextEditingController _controller = TextEditingController();
  String _output = "";
  bool _isLoading = false;

  final String apiKey = "TERI_API_KEY_YAHAN_DAL";

  Future<void> _generateContent() async {
    if (_controller.text.isEmpty) return;

    setState(() {
      _isLoading = true;
      _output = "";
    });

    try {
      final url = Uri.parse(
          "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey");

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {
                  "text": "Act as an expert viral content creator for ${widget.platformName}. Generate a hook, script, and hashtags for this topic/idea: ${_controller.text}"
                }
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _output = data['candidates'][0]['content']['parts'][0]['text'];
        });
      } else {
        setState(() {
          _output = "Error: Failed to fetch response (${response.statusCode})";
        });
      }
    } catch (e) {
      setState(() {
        _output = "Exception: $e";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.platformName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "अपना वीडियो टॉपिक यहाँ लिखें...",
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                onPressed: _isLoading ? null : _generateContent,
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Generate Viral Content 🚀', style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _output.isEmpty ? "वायरल स्क्रिप्ट यहाँ दिखाई देगी..." : _output,
                    style: const TextStyle(fontSize: 15, height: 1.4),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
