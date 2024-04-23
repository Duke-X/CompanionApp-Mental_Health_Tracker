import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calendar',
          style: TextStyle(
            fontWeight: FontWeight.w500, // Set font weight to 500
          ),
        ),
        backgroundColor: Colors.teal, // Set app bar background color to teal
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "Selected Day : ${today.toString().split(" ")[0]}",
                style: const TextStyle(
                  color: Colors.black, // Set text color to white
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TableCalendar(
                  locale: "en_US",
                  rowHeight: 40,
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  focusedDay: today,
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  calendarStyle: CalendarStyle(
                    defaultTextStyle: const TextStyle(color: Colors.teal), // Set default day text color to teal
                    todayDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black12.withOpacity(0.2), // Set today's background color to off-white
                    ),
                    selectedDecoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.teal, // Set selected day's background color to teal
                    ),
                    selectedTextStyle: const TextStyle(color: Colors.white), // Set selected day text color to white
                    todayTextStyle: const TextStyle(color: Colors.white), // Set today's text color to white
                  ),
                  onDaySelected: _onDaySelected,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
