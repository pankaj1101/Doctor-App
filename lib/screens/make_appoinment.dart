// import 'package:date_time_picker_widget/date_time_picker_widget.dart';
import 'package:date_time_picker_widget/date_time_picker_widget.dart';

import 'package:doctorapp/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class MakeAppoinment extends StatefulWidget {
  const MakeAppoinment({super.key});

  @override
  State<MakeAppoinment> createState() => _MakeAppoinmentState();
}

class _MakeAppoinmentState extends State<MakeAppoinment> {
  late CalendarFormat _calendarFormat;
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  String _t2 = '';

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _selectedDay = DateTime.now();
    _focusedDay = DateTime.now();
  }

  var hour = 0;
  var minute = 0;
  String timeFormate = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFF4F6FA),
              ),
              child: TableCalendar(
                // calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
                firstDay: DateTime.now(),
                focusedDay: _focusedDay,
                lastDay: DateTime(3023, 12, 31),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: DateTimePicker(
              startTime: DateTime(DateTime.now().year, DateTime.now().month,
                  DateTime.now().day, 6, 30),
              type: DateTimePickerType.Time,
              timeInterval: const Duration(minutes: 30),
              onTimeChanged: (time) {
                setState(() {
                  _t2 = DateFormat('hh:mm aa').format(time);
                });
              },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     decoration: BoxDecoration(
          //         color: Colors.black87,
          //         borderRadius: BorderRadius.circular(10)),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: [
          //         NumberPicker(
          //           value: hour,
          //           minValue: 0,
          //           maxValue: 12,
          //           infiniteLoop: true,
          //           zeroPad: true,
          //           itemWidth: 80,
          //           itemHeight: 60,
          //           selectedTextStyle:
          //               const TextStyle(color: Colors.white, fontSize: 25),
          //           textStyle:
          //               const TextStyle(color: Colors.grey, fontSize: 25),
          //           decoration: const BoxDecoration(
          //               border: Border(
          //             top: BorderSide(color: Colors.white),
          //             bottom: BorderSide(color: Colors.white),
          //           )),
          //           onChanged: (value) => setState(() => hour = value),
          //         ),
          //         NumberPicker(
          //           value: minute,
          //           minValue: 0,
          //           maxValue: 60,
          //           infiniteLoop: true,
          //           zeroPad: true,
          //           itemWidth: 80,
          //           itemHeight: 60,
          //           selectedTextStyle:
          //               const TextStyle(color: Colors.white, fontSize: 25),
          //           textStyle:
          //               const TextStyle(color: Colors.grey, fontSize: 25),
          //           decoration: const BoxDecoration(
          //               border: Border(
          //             top: BorderSide(color: Colors.white),
          //             bottom: BorderSide(color: Colors.white),
          //           )),
          //           onChanged: (value) => setState(() => minute = value),
          //         ),
          //         Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             InkWell(
          //               onTap: () {
          //                 setState(() {
          //                   timeFormate = "AM";
          //                 });
          //               },
          //               child: Container(
          //                 padding: const EdgeInsets.symmetric(
          //                     horizontal: 20, vertical: 10),
          //                 decoration: BoxDecoration(
          //                     color: Colors.grey.shade800,
          //                     border: Border.all(
          //                         width: timeFormate == "AM" ? 2 : 1,
          //                         color: timeFormate == "AM"
          //                             ? Colors.purple.shade300
          //                             : Colors.white)),
          //                 child: const Text("AM",
          //                     style: TextStyle(color: Colors.white)),
          //               ),
          //             ),
          //             const SizedBox(height: 10),

          //             InkWell(
          //               onTap: () {
          //                 setState(() {
          //                   timeFormate = "PM";
          //                 });
          //               },
          //               child: Container(
          //                 padding: const EdgeInsets.symmetric(
          //                     horizontal: 20, vertical: 10),
          //                 decoration: BoxDecoration(
          //                     color: Colors.grey.shade800,
          //                     border: Border.all(
          //                         width: timeFormate == "PM" ? 2 : 1,
          //                         color: timeFormate == "PM"
          //                             ? Colors.purple.shade300
          //                             : Colors.white)),
          //                 child: const Text("PM",
          //                     style: TextStyle(color: Colors.white)),
          //               ),
          //             ),
          //           ],
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16, left: 16),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                      size: 15,
                    ),
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                    Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                    Text(
                      "Back To Appoinment",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
