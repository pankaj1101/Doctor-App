class DoctorModel {
  static List<Details> details = [
    
  ];
}

class Details {
  final int id;
  final String name;
  final String specialist;
  final String imagePath;
  final int ratingCount;

  Details({
    required this.id,
    required this.name,
    required this.specialist,
    required this.imagePath,
    required this.ratingCount,
  });

  factory Details.fromMap(Map<String, dynamic> map) {
    return Details(
        id: map["id"],
        name: map["name"],
        specialist: map["specialist"],
        imagePath: map["imagePath"],
        ratingCount: map["ratingCount"]);
  }

  toMap() => {
        "id": id,
        "name": name,
        "specialist": specialist,
        "imagePath": imagePath,
        "ratingCount": ratingCount,
      };
}
