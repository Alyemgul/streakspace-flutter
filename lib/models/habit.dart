class Habit {
  final String name;
  final Set<DateTime> completedDays;

  Habit({
    required this.name,
    Set<DateTime>? completedDays,
  }) : completedDays = completedDays ?? {};

  DateTime _dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  bool get completedToday {
    return completedDays.contains(_dateOnly(DateTime.now()));
  }

  void completeToday() {
    completedDays.add(_dateOnly(DateTime.now()));
  }

  void undoToday() {
    completedDays.remove(_dateOnly(DateTime.now()));
  }

  int get streak {
    int count = 0;
    DateTime current = _dateOnly(DateTime.now());

    if (!completedToday) {
      current = current.subtract(const Duration(days: 1));
    }

    while (completedDays.contains(current)) {
      count++;
      current = current.subtract(const Duration(days: 1));
    }

    return count;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'completedDays': completedDays
          .map((date) => date.toIso8601String())
          .toList(),
    };
  }

  factory Habit.fromJson(Map<String, dynamic> json) {
    return Habit(
      name: json['name'],
      completedDays: (json['completedDays'] as List)
          .map((dateString) => DateTime.parse(dateString))
          .toSet(),
    );
  }
}