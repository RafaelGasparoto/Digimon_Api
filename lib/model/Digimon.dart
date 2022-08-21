class Digimon{
  String? nome;
  String? id;
  String? imagem;

  Digimon({this.nome, this.id, this.imagem});

  factory Digimon.fromJson(Map<String, dynamic> json) {
    return Digimon(
      imagem: json['images'][0]['href'],
      nome: json['name'],
      id: json['id'].toString()
    );
  }
}