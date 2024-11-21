import 'package:flutter/material.dart';
import '../widgets/week_day_selector.dart';
import '../widgets/day_info_card.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({Key? key}) : super(key: key);

  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            WeekDaySelector(
              today: DateTime.now(),
              onDateSelected: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
            ),
            const SizedBox(height: 16),
            DayInformationCard(selectedDate: selectedDate),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
