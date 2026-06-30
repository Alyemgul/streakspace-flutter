import 'package:flutter/material.dart';

class AddHabitDialog extends StatefulWidget {
  final Function(String) onAdd;

  const AddHabitDialog({
    super.key,
    required this.onAdd,
  });

  @override
  State<AddHabitDialog> createState() => _AddHabitDialogState();
}

class _AddHabitDialogState extends State<AddHabitDialog> {
  final TextEditingController controller = TextEditingController();

  void submit() {
    widget.onAdd(controller.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Habit'),
      content: TextField(
        controller: controller,
        autofocus: true,
        decoration: const InputDecoration(
          hintText: 'Example: Read 10 pages',
        ),
        onSubmitted: (_) => submit(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: submit,
          child: const Text('Add'),
        ),
      ],
    );
  }
}