class LeaderboardEntry {
  final String name;
  final int amount;

  LeaderboardEntry({required this.name, required this.amount});

  factory LeaderboardEntry.fromJson(Map<String, dynamic> json) {
    return LeaderboardEntry(name: json['name'], amount: json['amount']);
  }
}
