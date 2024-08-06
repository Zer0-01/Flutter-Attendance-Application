import 'package:flutter/material.dart';

class EndSessionDialogView extends StatefulWidget {
  const EndSessionDialogView({super.key});

  @override
  State<EndSessionDialogView> createState() => _EndSessionDialogViewState();
}

class _EndSessionDialogViewState extends State<EndSessionDialogView> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('End Session Confirmation'),
      content: const Text('Are you sure you want to end the session?'),
      actionsPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: const Text('End'),
          onPressed: () {
            // Handle the proceed action
          },
        ),
      ],
    );
  }
}
