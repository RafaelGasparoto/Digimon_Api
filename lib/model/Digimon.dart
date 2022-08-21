class Digimon{
  String? name;
  String? id;
  String? image;
  String? type;

  Digimon({this.name, this.id, this.image, this.type});

  factory Digimon.fromJson(Map<String, dynamic> json) {
    return Digimon(
      image: json['images'][0]['href'],
      name: json['name'],
      id: json['id'].toString(),
      type: json['types'][0]['type']
    );
  }
}