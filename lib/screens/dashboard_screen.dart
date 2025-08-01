import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final String internName;
  final String referralCode = "harsh2025";
  final int totalDonations = 5000;

  const DashboardScreen({required this.internName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F2FF), // Light purple background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting Section
              Text(
                "Welcome, $internName 👋",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[800],
                ),
              ),
              SizedBox(height: 6),
              Text(
                "Referral Code: $referralCode",
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),

              SizedBox(height: 24),

              // Donation Info Card
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 3,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 20,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.volunteer_activism,
                        size: 36,
                        color: Colors.green,
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Donations Raised",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "₹$totalDonations",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 28),

              // Rewards Section
              Text(
                "Your Rewards 🎁",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 12),

              // Grid of Rewards
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1,
                  children: const [
                    RewardCard(title: "Bronze Badge", icon: Icons.emoji_events),
                    RewardCard(title: "T-Shirt", icon: Icons.shopping_bag),
                    RewardCard(title: "Certificate", icon: Icons.school),
                    RewardCard(title: "Leaderboard Star", icon: Icons.star),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RewardCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const RewardCard({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple[100],
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: Colors.deepPurple[700]),
              SizedBox(height: 12),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple[900],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
