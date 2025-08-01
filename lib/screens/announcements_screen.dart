import 'package:flutter/material.dart';

class AnnouncementsScreen extends StatelessWidget {
  final List<String> announcements = [
    "🎉 Welcome to the Internship Program!",
    "🏆 Top 3 interns will receive exclusive rewards.",
    "📢 Use your referral code to increase your donation count.",
    "📆 Final leaderboard will be announced on September 30.",
    "🚀 Stay active and check for new updates regularly!",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: announcements.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Icon(Icons.campaign_rounded, color: Colors.deepPurple),
              title: Text(announcements[index], style: TextStyle(fontSize: 16)),
            ),
          );
        },
      ),
    );
  }
}
