import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeekDaySelector extends StatelessWidget {
  final DateTime today;
  final ValueChanged<DateTime> onDateSelected;

  const WeekDaySelector({
    Key? key,
    required this.today,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> weekDays = [
      'Lunes',
      'Martes',
      'Miércoles',
      'Jueves',
      'Viernes',
      'Sábado',
      'Domingo',
    ];

    final int currentDayIndex = today.weekday - 1; // Lunes es 0, Domingo es 6
    final List<String> orderedWeekDays = [
      ...weekDays.sublist(currentDayIndex),
      ...weekDays.sublist(0, currentDayIndex),
    ];

    final List<DateTime> weekDates = List.generate(
      7,
      (index) => today.add(Duration(days: index - 3)), // 3 días antes y después
    );

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: List.generate(7, (index) {
          final DateTime date = weekDates[index];
          final bool isToday = index == 3; // Día actual al centro
          final bool isFuture = date.isAfter(today);

          String formattedDate = DateFormat('d').format(date);

          if (isToday) {
            final String monthAbbr = DateFormat('MMM').format(date);
            formattedDate = 'Hoy, $formattedDate $monthAbbr';
          }

          return Expanded(
            child: GestureDetector(
              onTap: isFuture
                  ? null
                  : () {
                      onDateSelected(date);
                    },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  formattedDate,
                  style: TextStyle(
                    fontSize: 14,
                    color: isFuture
                        ? Colors.grey
                        : Colors.black, // Días futuros en gris
                    fontWeight: isToday
                        ? FontWeight.bold
                        : FontWeight.normal, // Destacar el día actual
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
