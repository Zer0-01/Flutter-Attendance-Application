import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/utils/extension.dart';

class YourActivityWidget extends StatelessWidget {
  const YourActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Expanded(
              child: Text(
                context.l10n.your_activity,
                style: context.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(onPressed: () {}, child: Text(context.l10n.view_all))
          ],
        ),
      ),
    );
  }
}
