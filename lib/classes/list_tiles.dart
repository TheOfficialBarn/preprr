import 'package:flutter/material.dart';

class GroceryListTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final ValueChanged<bool?>? onChanged;

  GroceryListTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, //Barn edit from HackKU code
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ]
      ),
      child: Row(
        children: [
          Checkbox(
            value: taskCompleted,
            onChanged: onChanged,
            activeColor: Theme.of(context).colorScheme.primary, //This color maybe should go with a Text Theme Color
          ),
          Text(
            taskName,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inverseSurface, //This color maybe should go with a Text Theme Color 
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}