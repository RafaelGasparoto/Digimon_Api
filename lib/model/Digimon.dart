class Digimon{
  String? name;
  String? id;
  String? image;
  String? type;

  Digimon({this.name, this.id, this.image, this.type});

  factory Digimon.fromJson(Map<String, dynamic> json) {
    return Digimon(
      name: json['name'],
    );
  }
}