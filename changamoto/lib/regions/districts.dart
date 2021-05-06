import 'package:flutter/material.dart';

class Districts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DistrictsState();
  }
}

class _DistrictsState extends State<Districts> {
  var _district = ['Ilala', 'Kinondoni', 'Temeke'];
  var _currentItemSelected = ['Districts'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DropdownButton<String>(
            items: _district.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            value: 'Ilala',
            onChanged: (String newValueSelected) {
              setState(() {
                this._currentItemSelected = newValueSelected as List<String>;
              });
            },
          ),
        ],
      ),
    );
  }
}
