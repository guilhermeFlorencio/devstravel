import 'package:flutter/material.dart';

import 'haircut_appointment.dart';

class HaircutAppointmentScreen extends StatefulWidget {
  @override
  _HaircutAppointmentScreenState createState() =>
      _HaircutAppointmentScreenState();
}

class _HaircutAppointmentScreenState extends State<HaircutAppointmentScreen> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime)
      setState(() {
        _selectedTime = picked;
      });
  }

  String? _selectedStylist; // Declaração de _selectedStylist

// Lista de cabeleireiros disponíveis
  final List<String> _stylists = ['Alice', 'Bob', 'Charlie', 'David'];

// Widget para exibir a lista suspensa de cabeleireiros
  Widget _buildStylistDropdown() {
    return DropdownButtonFormField<String>(
      value: _selectedStylist,
      onChanged: (newValue) {
        setState(() {
          _selectedStylist = newValue;
        });
      },
      items: _stylists.map((stylist) {
        return DropdownMenuItem<String>(
          value: stylist,
          child: Text(stylist),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: 'Cabeleireiro',
        border: OutlineInputBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendar corte de cabelo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Selecione a data:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    onPressed: () => _selectDate(context),
                    child: Text(
                      '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Selecione o horário:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    onPressed: () => _selectTime(context),
                    child: Text(
                      '${_selectedTime.hour}:${_selectedTime.minute.toString().padLeft(2, '0')}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Crie um novo agendamento
                  final appointment = HaircutAppointment(
                    date: _selectedDate,
                    time: _selectedTime,
                    stylist: _selectedStylist,
                  );

                  // Adicione o novo agendamento à lista de agendamentos
                  // setState(() {
                  //   _appointments.add(appointment);
                  // });

                  // Navegue de volta para a tela principal
                  Navigator.pop(context);
                },
                child: Text('Agendar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
