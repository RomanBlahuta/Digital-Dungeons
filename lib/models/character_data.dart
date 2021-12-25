

class Character {

  final String name;
  final String uid;

  Character(this.name, this.uid);

  Character.fromJson(Map<dynamic, dynamic> json)
      : name = json['name'] as String,
        uid = json['uid'] as String;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'name': name,
    'uid': uid,
  };
}