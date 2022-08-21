class Digimon{
  String? nome;
  String? id;
  String? imagem;

  Digimon({this.nome, this.id, this.imagem});

  factory Digimon.fromJson(Map<String, dynamic> json) {
    return Digimon(
      id: json['id'],
      nome: json['name'],
    );
  }
}