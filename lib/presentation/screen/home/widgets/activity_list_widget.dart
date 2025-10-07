import 'package:flutter/material.dart';
import 'package:flutter_attendance_application/data/model/response/activity_list_dto_response.dart';
import 'package:flutter_attendance_application/presentation/screen/home/bloc/home_bloc.dart';
import 'package:flutter_attendance_application/utils/constants.dart';
import 'package:flutter_attendance_application/utils/extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ActivityListWidget extends StatelessWidget {
  const ActivityListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverList.separated(
              itemCount: state.activityList.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
              itemBuilder: (context, index) {
                final ActivityData activityData = state.activityList[index];
                final String type = _getType(context, activityData.type);
                final DateTime date = activityData.date;
                final String dateStr = DateFormat("d MMM yyyy").format(date);
                final String timeStr = DateFormat("hh:mm a").format(date);
                final String status = activityData.status;

                return Card(
                  child: ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            type,
                            style: context.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: _getTypeColor(type)),
                          ),
                        ),
                        Text(timeStr,
                            style: context.textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    subtitle: Row(
                      children: [Expanded(child: Text(dateStr)), Text(status)],
                    ),
                  ),
                );
              },
            ));
      },
    );
  }

  String _getType(BuildContext context, String type) {
    final String formattedType = type.toLowerCase();

    switch (formattedType) {
      case ActivityTypeConstant.checkIn:
        return context.l10n.check_in;
      case ActivityTypeConstant.checkOut:
        return context.l10n.check_out;
      default:
        return formattedType.toUpperCase();
    }
  }

  Color _getTypeColor(String type) {
    final String formattedType = type.toLowerCase();

    switch (formattedType) {
      case ActivityTypeConstant.checkIn:
        return Colors.green.shade600;
      case ActivityTypeConstant.checkOut:
        return Colors.red.shade600;
      default:
        return Colors.grey;
    }
  }
}
