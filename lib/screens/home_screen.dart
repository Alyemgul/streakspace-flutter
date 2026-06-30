import 'package:flutter/material.dart';

import '../services/habit_storage.dart';
import '../models/habit.dart';
import '../widgets/add_habit_dialog.dart';
import '../widgets/habit_card.dart';
import '../widgets/stats_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Habit> habits = [];

  int get completedCount {
    return habits.where((habit) => habit.completedToday).length;
  }

  int get totalStreaks {
    return habits.fold(0, (sum, habit) => sum + habit.streak);
  }

  void completeHabit(Habit habit) {
    setState(() {
      habit.completeToday();
    });

    saveHabits();
  }

  void addHabit(String name) {
    if (name.trim().isEmpty) return;

    setState(() {
      habits.add(Habit(name: name.trim()));
    });

    saveHabits();
  }

  void openAddHabitDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AddHabitDialog(onAdd: addHabit);
      },
    );
  }

  void confirmDeleteHabit(Habit habit) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete habit?'),
          content: Text('Are you sure you want to delete "${habit.name}"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                deleteHabit(habit);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void deleteHabit(Habit habit) {
    setState(() {
      habits.remove(habit);
    });

    saveHabits();
  }

  void undoHabit(Habit habit) {
    setState(() {
      habit.undoToday();
    });

    saveHabits();
  }

  @override
  void initState() {
    super.initState();
    loadSavedHabits();
  }

  Future<void> loadSavedHabits() async {
    final savedHabits = await HabitStorage.loadHabits();

    setState(() {
      habits = savedHabits.isEmpty ? [] : savedHabits;
    });
  }

  Future<void> saveHabits() async {
    await HabitStorage.saveHabits(habits);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F4FF),
      appBar: AppBar(
        title: const Text('StreakSpace'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openAddHabitDialog,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            StatsCard(
              completed: completedCount,
              total: habits.length,
              totalStreaks: totalStreaks,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: habits.isEmpty
                  ? const Center(
                      child: Text(
                        'No habits yet. Add your first one!',
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: habits.length,
                      itemBuilder: (context, index) {
                        final habit = habits[index];

                        return HabitCard(
                          habit: habit,
                          onComplete: () => completeHabit(habit),
                          onDelete: () => confirmDeleteHabit(habit),
                          onUndo: () => undoHabit(habit),
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
