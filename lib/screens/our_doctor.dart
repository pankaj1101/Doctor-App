import 'dart:convert';
import 'package:doctorapp/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../models/doctor.dart';

class OurDoctor extends StatefulWidget {
  const OurDoctor({super.key});

  @override
  State<OurDoctor> createState() => _OurDoctorState();
}

class _OurDoctorState extends State<OurDoctor> {
  @override
  void initState() {
    super.initState();
    loadFile();
  }

  loadFile() async {
    var doctorListJson = await rootBundle
        .loadString("assets/jsonfiles/doctor_details_json.json");
    var decodeData = jsonDecode(doctorListJson);
    var doctorList = decodeData["doctorList"];
    setState(() {
      DoctorModel.details = List.from(doctorList)
          .map<Details>((details) => Details.fromMap(details))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Our Doctors"),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TopMapCard(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Nearby Doctors",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  TextButton(onPressed: () {}, child: const Text("See all")),
                ],
              ),
            ),
            const NearbyDoctorList(),
          ],
        ),
      ),
    );
  }
}

class NearbyDoctorList extends StatelessWidget {
  const NearbyDoctorList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DoctorModel.details.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: DoctorModel.details.length,
            itemBuilder: (BuildContext context, index) {
              final doctor = DoctorModel.details[index];
              return Slidable(
                closeOnScroll: true,
                endActionPane: ActionPane(
                  extentRatio: 0.25,
                  motion: const BehindMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ChatScreen(doctorName: doctor.name)));
                      },
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      icon: Icons.message_outlined,
                    ),
                  ],
                ),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(doctor.imagePath),
                        backgroundColor: Colors.grey[400],
                        radius: 25,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctor.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            doctor.specialist,
                            style:
                                const TextStyle(fontWeight: FontWeight.normal),
                          ),
                          Row(
                            children: List.generate(5, (index) {
                              if (index < doctor.ratingCount) {
                                return const Icon(Icons.star,
                                    color: Colors.yellow);
                              } else {
                                return const Icon(Icons.star_border,
                                    color: Colors.yellow);
                              }
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        : const Center(child: CircularProgressIndicator());
  }
}

class TopMapCard extends StatelessWidget {
  const TopMapCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/HomeIcon/stethoscope.png"),
                  backgroundColor: Colors.white,
                  radius: 25,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Find Doctor!",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Use this feature to find a doctor\nclosest to you",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                      textScaleFactor: 1.2,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(height: 1, color: Colors.white),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              height: 150,
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.all(20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child:
                      Image.asset("assets/images/map.jpg", fit: BoxFit.cover)),
            ),
          )
        ]),
      ),
    );
  }
}
