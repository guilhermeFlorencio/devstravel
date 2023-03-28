import 'package:flutter/material.dart';

import 'haircut_appointment_list_screen.dart';
import 'haircut_appointment_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agendamento de cortes de cabelo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      routes: {
        '/haircut-appointments': (context) => HaircutAppointmentsListScreen(),
        '/haircut-appointment': (context) => HaircutAppointmentScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/haircut-appointments');
              },
              child: Text('Meus Agendamentos'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/haircut-appointment');
              },
              child: Text('Agendar Novo Corte'),
            ),
          ],
        ),
      ),
    );
  }
}
