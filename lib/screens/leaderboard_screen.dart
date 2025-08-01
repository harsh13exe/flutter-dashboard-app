import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intern_fund/models/leaderboard_model.dart';

class LeaderboardScreen extends StatefulWidget {
  @override
  _LeaderboardScreenState createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  List<LeaderboardEntry> entries = [];

  @override
  void initState() {
    super.initState();
    loadLeaderboardData();
  }

  Future<void> loadLeaderboardData() async {
    final String response = await rootBundle.loadString(
      'lib/data/leaderboard.json',
    );
    final List data = json.decode(response);
    setState(() {
      entries = data.map((e) => LeaderboardEntry.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F2FF),
      body: Container(
        child:
            entries.isEmpty
                ? const Center(
                  child: CircularProgressIndicator(color: Colors.deepPurple),
                )
                : ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  itemCount: entries.length,
                  itemBuilder: (context, index) {
                    final user = entries[index];
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        leading: CircleAvatar(
                          radius: 24,
                          backgroundColor: const Color.fromARGB(
                            255,
                            44,
                            175,
                            237,
                          ),
                          child: Text(
                            "${index + 1}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          user.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: Text(
                          "₹${user.amount}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
