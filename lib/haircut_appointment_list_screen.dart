import 'package:flutter/material.dart';

class HaircutAppointmentsListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> _appointments = [
    {
      'date': DateTime.now().add(Duration(days: 2)),
      'time': TimeOfDay(hour: 10, minute: 30),
      'barber': 'João',
    },
    {
      'date': DateTime.now().add(Duration(days: 5)),
      'time': TimeOfDay(hour: 15, minute: 0),
      'barber': 'Maria',
    },
    {
      'date': DateTime.now().add(Duration(days: 7)),
      'time': TimeOfDay(hour: 9, minute: 0),
      'barber': 'Pedro',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus agendamentos'),
      ),
      body: ListView.builder(
        itemCount: _appointments.length,
        itemBuilder: (BuildContext context, int index) {
          final appointment = _appointments[index];
          final date = appointment['date'] as DateTime;
          final time = appointment['time'] as TimeOfDay;
          final barber = appointment['barber'] as String;
          return ListTile(
            leading: Icon(Icons.event),
            title: Text(
              '${date.day}/${date.month}/${date.year} às ${time.hour}:${time.minute.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text(
              'Barbeiro(a): $barber',
              style: TextStyle(fontSize: 16),
            ),
          );
        },
      ),
    );
  }
}
