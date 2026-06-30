import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  final int completed;
  final int total;
  final int totalStreaks;

  const StatsCard({
    super.key,
    required this.completed,
    required this.total,
    required this.totalStreaks,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _StatItem(label: 'Done Today', value: '$completed/$total'),
            _StatItem(label: 'Total Streaks', value: '$totalStreaks'),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}