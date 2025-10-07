import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/presentation/screen/home/bloc/home_bloc.dart';
import 'package:flutter_attendance_application/utils/extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClockWidget extends StatelessWidget {
  const ClockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SliverPadding(
          padding: const EdgeInsets.all(8),
          sliver: SliverToBoxAdapter(
            child: SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 16,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8,
                        children: [
                          Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: context.colorScheme.secondary),
                              child: Text(
                                state.hour,
                                style: context.textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: context.colorScheme.onSecondary),
                              )),
                          const Text(":"),
                          Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: context.colorScheme.secondary),
                              child: Text(state.minute,
                                  style: context.textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: context.colorScheme.onSecondary))),
                          const Text(":"),
                          Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: context.colorScheme.secondary),
                              child: Text(state.second,
                                  style: context.textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: context.colorScheme.onSecondary))),
                        ],
                      ),
                      const Row(
                        spacing: 4,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on_outlined),
                          Text("SK Sultan Alam Shah ")
                        ],
                      ),
                      FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                            shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                        child: const Text("Checkin"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
