import 'dart:convert';
import 'package:doctorapp/models/doctor.dart';
import 'package:doctorapp/screens/our_doctor.dart';
import 'package:doctorapp/screens/widgets/homepage_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchBoxConntroller = TextEditingController();

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
  void dispose() {
    _searchBoxConntroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Header(),
            CustomSearchBox(searchBoxConntroller: _searchBoxConntroller),
            const CustomCard(),
            const CustomMiniCard(),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Our Doctors",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OurDoctor()));
                      },
                      child: const Text("See all")),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: DoctorModel.details.length,
              itemBuilder: (BuildContext context, index) {
                final doctor = DoctorModel.details[index];
                return Card(
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
                            style: const TextStyle(
                                fontWeight: FontWeight.normal),
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
