
class Character {

  String name = "";
  String player = "";
  String level = "";
  String charClass = "";
  String race = "";
  String background = "";
  String money = "";
  String equipment = "";

  Character();

  Character.fromJson(Map<dynamic, dynamic> json)
      : name = json['name'] as String,
        player = json['player'] as String,
        level = json['level'] as String,
        charClass = json['charClass'] as String,
        race = json['race'] as String,
        background = json['background'] as String,
        money = json['money'] as String,
        equipment = json['equipment'] as String;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
     'name': name,
     'player': player,
     'level': level,
     'charClass': charClass,
     'race': race,
     'background': background,
     'money': money,
     'equipment': equipment,
  };
}