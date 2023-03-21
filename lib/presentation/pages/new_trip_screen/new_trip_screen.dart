import 'package:flutter/material.dart';

class NewTripScreen extends StatefulWidget {
  @override
  _NewTripScreenState createState() => _NewTripScreenState();
}

class _NewTripScreenState extends State<NewTripScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String _tripName;
  late String _destination;
  late DateTime _date;
  bool _requiresRiskAssessment = false;
  late String _description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Trip'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Name of trip'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name of the trip';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _tripName = value!;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Destination'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the destination';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _destination = value!;
                  });
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Date of the trip'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the date of the trip';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _date = DateTime.parse(value!);
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Requires risk assessment'),
                value: _requiresRiskAssessment,
                onChanged: (value) {
                  setState(() {
                    _requiresRiskAssessment = value ?? false;
                  });
                },
              ),
              TextFormField(
                decoration:
                    InputDecoration(labelText: 'Description (optional)'),
                onSaved: (value) {
                  setState(() {
                    _description = value ?? "";
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Submit data
                  }
                },
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
