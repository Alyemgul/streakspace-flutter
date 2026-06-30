import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/habit.dart';

class HabitStorage {
  static const String _key = 'habits';

  static Future<void> saveHabits(List<Habit> habits) async {
    final prefs = await SharedPreferences.getInstance();

    final habitJsonList = habits.map((habit) {
      return jsonEncode(habit.toJson());
    }).toList();

    await prefs.setStringList(_key, habitJsonList);
  }

  static Future<List<Habit>> loadHabits() async {
    final prefs = await SharedPreferences.getInstance();

    final habitJsonList = prefs.getStringList(_key);

    if (habitJsonList == null) {
      return [];
    }

    return habitJsonList.map((habitJson) {
      final decodedHabit = jsonDecode(habitJson);
      return Habit.fromJson(decodedHabit);
    }).toList();
  }
}