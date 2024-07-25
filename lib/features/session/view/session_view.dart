import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/features/session/view_model/session_view_model.dart';
import 'package:provider/provider.dart';

class SessionView extends StatefulWidget {
  static const String id = 'session_view';

  const SessionView({super.key});

  @override
  State<SessionView> createState() => _SessionViewState();
}

class _SessionViewState extends State<SessionView> {
  SessionViewModel vm = SessionViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vm.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ChangeNotifierProvider<SessionViewModel>(
        create: (context) => vm,
        child: Consumer<SessionViewModel>(
          builder: (context, vm, child) {
            return Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: vm.dateController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          vm.displayDatePicker(context);
                        },
                        icon: Icon(Icons.date_range),
                      ),
                    ),
                  ),
                  TextFormField(),
                  TextFormField(),
                  TextFormField(),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Cancel'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('OK'),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  controller: vm.dateController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        vm.displayDatePicker(context);
                      },
                      icon: Icon(Icons.date_range),
                    ),
                  ),
                ),
                TextFormField(),
                TextFormField(),
                TextFormField(),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('OK'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
