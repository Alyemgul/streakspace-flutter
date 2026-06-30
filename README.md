# StreakSpace 🔥

A simple Flutter habit tracker that helps users build consistent daily habits by tracking streaks. Built with Flutter and Dart for **TSOC 2026**.

## Features

* ✅ Create new habits
* 🔥 Automatic streak calculation based on completed dates
* 📅 Mark habits as completed for today
* ↩️ Undo today's completion
* 🗑️ Delete habits with confirmation
* 📊 View daily progress and streak statistics
* 💾 Local data persistence using Shared Preferences
* 🎨 Clean Material 3 interface

## Tech Stack

* Flutter
* Dart
* Shared Preferences

## Project Structure

```text
lib/
├── data/
│   └── starter_habits.dart
├── models/
│   └── habit.dart
├── screens/
│   └── home_screen.dart
├── services/
│   └── habit_storage.dart
├── widgets/
│   ├── add_habit_dialog.dart
│   ├── habit_card.dart
│   └── stats_card.dart
└── main.dart
```

## Getting Started

### Prerequisites

* Flutter SDK
* Android Studio or VS Code
* Android Emulator or a physical device

### Installation

Clone the repository:

```bash
git clone https://github.com/<your-username>/streakspace-flutter.git
```

Navigate to the project:

```bash
cd streakspace-flutter
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

## Building the APK

To generate a release APK:

```bash
flutter build apk --release
```

The APK will be available at:

```text
build/app/outputs/flutter-apk/app-release.apk
```

## How It Works

Each habit stores the dates on which it was completed. Instead of manually increasing or decreasing a streak counter, the current streak is calculated dynamically from the completion history. This approach keeps streaks accurate, supports undoing today's completion, and automatically handles missed days.

## Future Improvements

* Notifications and daily reminders
* Calendar view
* Habit categories
* Dark mode
* Weekly and monthly analytics
* Cloud synchronization
* Multiple devices support

## License

This project was created for the **TSOC 2026 Hackathon** as a learning project and demonstration of Flutter development.
