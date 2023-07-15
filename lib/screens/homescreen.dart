import 'dart:convert';
import 'package:doctorapp/models/doctor.dart';
import 'package:doctorapp/screens/our_doctor.dart';
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomMiniCard extends StatelessWidget {
  const CustomMiniCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        CustomMiniCardWithIconAndText(
            imagePath: "assets/HomeIcon/drug.png", text: 'Drug'),
        CustomMiniCardWithIconAndText(
            imagePath: "assets/HomeIcon/virus.png", text: 'Virus'),
        CustomMiniCardWithIconAndText(
            imagePath: "assets/HomeIcon/heart.png", text: 'Psycho'),
        CustomMiniCardWithIconAndText(
            imagePath: "assets/HomeIcon/other.png", text: 'Other'),
      ]),
    );
  }
}

class CustomMiniCardWithIconAndText extends StatelessWidget {
  final String text, imagePath;

  const CustomMiniCardWithIconAndText({
    super.key,
    required this.text,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              border: Border.all(width: 0.8, color: Colors.grey),
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
              imagePath,
              // fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(text, style: const TextStyle(fontSize: 15))
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Card(
        color: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage:
                      const AssetImage("assets/HomeIcon/mens_doctor.png"),
                  backgroundColor: Colors.grey[400],
                  radius: 25,
                  // child: Image.asset("assets/HomeIcon/mens_doctor.png"),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "You're invited to join Live",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    RichText(
                      text: const TextSpan(
                        text: 'Stream with ',
                        style: TextStyle(fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Dr.Navido',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
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
          const Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "120% People Join Live Streaming",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                Icon(Icons.group, color: Colors.white),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class CustomSearchBox extends StatelessWidget {
  const CustomSearchBox({
    super.key,
    required TextEditingController searchBoxConntroller,
  }) : _searchBoxConntroller = searchBoxConntroller;

  final TextEditingController _searchBoxConntroller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
      child: TextFormField(
        controller: _searchBoxConntroller,
        autofocus: false,
        decoration: const InputDecoration(
          hintText: "Search",
          helperStyle: TextStyle(fontSize: 20),
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello,",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              Text(
                "Pankaj",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.notifications_outlined,
            size: 30,
          )
        ],
      ),
    );
  }
}
