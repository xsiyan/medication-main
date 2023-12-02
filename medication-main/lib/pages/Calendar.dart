import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class UserCalendar extends StatefulWidget {
  const UserCalendar({Key? key}) : super(key: key);

  @override
  _UserCalendarState createState() => _UserCalendarState();
}

class _UserCalendarState extends State<UserCalendar> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  final Map<DateTime, List<String>> events = {
    DateTime(2023, 12, 01): ['Event A', 'Event B'],
    DateTime(2023, 11, 15): ['Event C'],
    DateTime(2023, 11, 20): ['Event D', 'Event E', 'Event F'],
    DateTime(2023, 12, 05): ['Event G'],
    DateTime(2023, 12, 10): ['Event H', 'Event I'],
    DateTime(2023, 12, 15): ['Event J'],
  };

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'CALENDAR',
          style: GoogleFonts.firaSans(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: Column(
        children: [
          _buildCalendar(),
          Expanded(child: _buildEventList()),
        ],
      ),
    );
  }

  Widget _buildCalendar() {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      calendarFormat: _calendarFormat,
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format;
        });
      },
      onPageChanged: (focusedDay) {
        setState(() {
          _focusedDay = focusedDay;
        });
      },
      eventLoader: (day) {
        return _getEventsForDay(day);
      },
    );
  }

  List<String> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  Widget _buildEventList() {
    final selectedEvents = _getEventsForDay(_selectedDay);

    return ListView.builder(
      itemCount: selectedEvents.length,
      itemBuilder: (context, index) {
        final event = selectedEvents[index];
        return ListTile(
          title: Text(event),
        );
      },
    );
  }
}
