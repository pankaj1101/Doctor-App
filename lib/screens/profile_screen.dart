import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:doctorapp/screens/make_appoinment.dart';
import 'package:flutter/material.dart';

class DoctorProfile extends StatefulWidget {
  // final String doctorName;
  final Map<String, dynamic> doctorDetailsMap;
  const DoctorProfile({super.key, required this.doctorDetailsMap});

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  DateTime? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(widget.doctorDetailsMap['name'],
              style:
                  const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          Text(widget.doctorDetailsMap['specialist'],
              style: const TextStyle(fontSize: 20, color: Colors.grey)),
          const SizedBox(height: 10),
          const ProfilePageCard(
            iconData: Icons.star_rate_rounded,
            title: 'Ratings',
            subTitle: '4,5 From 5',
            iconColor: Colors.yellow,
          ),
          const ProfilePageCard(
            iconData: Icons.group,
            title: 'Patient',
            subTitle: '120 +',
            iconColor: Colors.indigoAccent,
          ),
          const SizedBox(height: 20),
          const Text(
            "Biography",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Text(
              "Chat doctor, visit hospitals, buy medicines, check the lab and update information about health all at Halodoc!",
              style: TextStyle(fontSize: 20, color: Colors.grey),
              textAlign: TextAlign.justify,
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            "Schedule",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
          ),
          const SizedBox(height: 20),
          DatePicker(
            width: 80,
            height: 80,
            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor: Colors.black,
            selectedTextColor: Colors.white,
            onDateChange: (date) {
              setState(() {
                _selectedValue = date;
              });
            },
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const MakeAppoinment();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
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
                    Text(
                      "Make an Appoinment",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 15,
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 18,
                    ),
                    Icon(Icons.arrow_forward_ios_rounded, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }
}

class ProfilePageCard extends StatelessWidget {
  final IconData iconData;
  final String title, subTitle;
  final Color iconColor;

  const ProfilePageCard({
    super.key,
    required this.iconData,
    required this.title,
    required this.subTitle,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Icon(
                iconData,
                size: 40,
                color: iconColor,
              )),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(color: Colors.grey, fontSize: 25)),
              const SizedBox(height: 5),
              Text(
                subTitle,
                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }
}
