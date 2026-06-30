import 'package:flutter/material.dart';

import '../models/habit.dart';

class HabitCard extends StatelessWidget {
  final Habit habit;
  final VoidCallback onComplete;
  final VoidCallback onDelete;
  final VoidCallback onUndo;

  const HabitCard({
    super.key,
    required this.habit,
    required this.onComplete,
    required this.onDelete,
    required this.onUndo,
  });

  Color get flameColor {
    if (habit.streak >= 7) return Colors.red;
    if (habit.streak >= 3) return Colors.orange;
    if (habit.streak >= 1) return Colors.amber;
    return Colors.grey;
  }

  String get subtitle {
    if (habit.completedToday) {
      return 'Completed today • ${habit.streak} day streak';
    }

    if (habit.streak == 0) {
      return 'Not started yet';
    }

    return '${habit.streak} day streak';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(Icons.local_fire_department, color: flameColor, size: 34),
        title: Text(
          habit.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (habit.completedToday)
              IconButton(
                onPressed: onUndo,
                icon: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 30,
                )
              )
            else
              ElevatedButton(onPressed: onComplete, child: const Text('Done')),
            IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete_outline),
            ),
          ],
        ),
      ),
    );
  }
}
