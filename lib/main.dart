import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const CreatorMahakoshApp());
}

class CreatorMahakoshApp extends StatelessWidget {
  const CreatorMahakoshApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Creator Mahakosh AI',
      theme: ThemeData.dark(),
      home: const ReelsGeneratorScreen(),
    );
  }
}

class ReelsGeneratorScreen extends StatefulWidget {
  const ReelsGeneratorScreen({super.key});

  @override
  State<ReelsGeneratorScreen> createState() => _ReelsGeneratorScreenState();
}

class _ReelsGeneratorScreenState extends State<ReelsGeneratorScreen> {
  final TextEditingController _topicController = TextEditingController();
  String _scriptOutput = "यहाँ रील्स की वायरल स्क्रिप्ट दिखाई देगी...";
  bool _isLoading = false;

  // एपीआई की सेव करने के लिए कंट्रोलर्स
  final TextEditingController _geminiKeyController = TextEditingController();
  final TextEditingController _grokKeyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedKeys(); // ऐप शुरू होते ही सेव की हुई की लोड कर लेगा
  }

  // मोबाइल की मेमोरी से एपीआई की लोड करना
  Future<void> _loadSavedKeys() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _geminiKeyController.text = prefs.getString('gemini_key') ?? '';
      _grokKeyController.text = prefs.getString('grok_key') ?? '';
    });
  }

  // कोने में सेटिंग डायलॉग बॉक्स दिखाने का फंक्शन
  void _openSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('API Settings'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _geminiKeyController,
                  decoration: const InputDecoration(
                    labelText: 'Gemini API Key डाल',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _grokKeyController,
                  decoration: const InputDecoration(
                    labelText: 'Grok API Key डाल',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('gemini_key', _geminiKeyController.text.trim());
                await prefs.setString('grok_key', _grokKeyController.text.trim());
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('API Keys Successfully Saved!')),
                );
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // 1. Google Gemini से स्क्रिप्ट जनरेट करने का फंक्शन
  Future<void> generateReelsWithGemini(String topic) async {
    String apiKey = _geminiKeyController.text.trim();
    if (apiKey.isEmpty) {
      setState(() {
        _scriptOutput = "भाई पहले कोने वाली सेटिंग से Gemini की API Key डाल!";
      });
      return;
    }

    const url = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=";
    final fullUrl = "$url$apiKey";

    setState(() {
      _isLoading = true;
      _scriptOutput = "Gemini वायरल स्क्रिप्ट तैयार कर रहा है...";
    });

    String prompt = "Act as an expert Instagram Reels scriptwriter. Create a highly engaging, viral 30-second reel script for the topic: '$topic'. Include a powerful Hook (first 3 seconds), Main Body, and a strong Call to Action (CTA) with relevant hashtags in Hinglish.";

    try {
      final response = await http.post(
        Uri.parse(fullUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "contents": [{"parts": [{"text": prompt}]}]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _scriptOutput = data['candidates'][0]['content']['parts'][0]['text'];
        });
      } else {
        setState(() {
          _scriptOutput = "Gemini Error: ${response.body}";
        });
      }
    } catch (e) {
      setState(() {
        _scriptOutput = "Exception: $e";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // 2. Grok API से स्क्रिप्ट जनरेट करने का फंक्शन
  Future<void> generateReelsWithGrok(String topic) async {
    String apiKey = _grokKeyController.text.trim();
    if (apiKey.isEmpty) {
      setState(() {
        _scriptOutput = "भाई पहले कोने वाली सेटिंग से Grok की API Key डाल!";
      });
      return;
    }

    const url = "https://api.x.ai/v1/chat/completions";

    setState(() {
      _isLoading = true;
      _scriptOutput = "Grok ट्रेंडिंग डेटा के साथ स्क्रिप्ट तैयार कर रहा है...";
    });

    String prompt = "Act as an expert viral content creator. Write a catchy and trending Instagram Reel script for the topic: '$topic'. Make it punchy, engaging, and format it with Hook, Body, and CTA in Hinglish.";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $apiKey",
        },
        body: jsonEncode({
          "model": "grok-beta",
          "messages": [
            {"role": "user", "content": prompt}
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _scriptOutput = data['choices'][0]['message']['content'];
        });
      } else {
        setState(() {
          _scriptOutput = "Grok Error: ${response.body}";
        });
      }
    } catch (e) {
      setState(() {
        _scriptOutput = "Exception: $e";
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
      appBar: AppBar(
        title: const Text('Creator Mahakosh AI'),
        centerTitle: true,
        actions: [
          // कोने में सेटिंग बटन
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => _openSettingsDialog(context),
            tooltip: 'API Settings',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _topicController,
              decoration: const InputDecoration(
                labelText: 'रील का टॉपिक यहाँ लिखें (जैसे: Fitness, Tech, Business)...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : () {
                    if (_topicController.text.isNotEmpty) {
                      generateReelsWithGemini(_topicController.text);
                    }
                  },
                  icon: const Icon(Icons.flash_on, color: Colors.amber),
                  label: const Text('Generate with Gemini'),
                ),
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : () {
                    if (_topicController.text.isNotEmpty) {
                      generateReelsWithGrok(_topicController.text);
                    }
                  },
                  icon: const Icon(Icons.bolt, color: Colors.blueAccent),
                  label: const Text('Generate with Grok'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : const SizedBox.shrink(),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    _scriptOutput,
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
