import 'package:flutter/material.dart';

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
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Dr. Rahul Nair',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
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
