import 'package:date_time_picker_widget/date_time_picker_widget.dart';
import 'package:doctorapp/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Sample extends StatefulWidget {
  const Sample({super.key});

  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  final Color _color = AppColors.primaryColor;
  String _t2 = '';
  // bool _material3 = true;

  @override
  Widget build(BuildContext context) {
    print(_t2);
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: _color,
          primary: _color,
          secondary: _color,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
            // title: Text(),
            ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _timePicker(),
                  const Divider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _timePicker() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        DateTimePicker(
          type: DateTimePickerType.Time,
          timeInterval: const Duration(minutes: 30),
          onTimeChanged: (time) {
            setState(() {
              _t2 = DateFormat('hh:mm aa').format(time);
            });
          },
        )
      ],
    );
  }
}
