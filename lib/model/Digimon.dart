class Digimon{
  String? name;
  String? id;
  String? image;
  String? type;
  List<dynamic>? skills;

  Digimon({this.name, this.id, this.image, this.type, this.skills});

  factory Digimon.fromJson(Map<String, dynamic> json) {
    return Digimon(
      image: json['images'][0]['href'],
      name: json['name'],
      id: json['id'].toString(),
      type: json['types'][0]['type'],
      skills: json['skills'].toList(),
    );
  }
}