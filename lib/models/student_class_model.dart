import 'dart:convert';
import 'dart:math';

class StudentClassModel {
  String name;
  String grade1;
  String grade2;
  String grade3;
  String ciu;
  String imageProfile;
  bool isPresent1;
  bool isPresent2;

  StudentClassModel({
    required this.name,
    required this.grade1,
    required this.grade2,
    required this.grade3,
    required this.ciu,
    required this.imageProfile,
    required this.isPresent1,
    required this.isPresent2,
  });

  static List<StudentClassModel> getTeste() {
    List<StudentClassModel> list = [];
    List<String> names = [
      'Ana Julia Santos',
      'Ana Alice Soares',
      'Bruno Mendes Maia',
      'Caio Rodrigues Silva',
      'Cristiano Ronaldo Santos',
      'Daniel Carvalho Dias',
      'Fernando Henrique Morais',
      'Gustavo Soares Barros',
      'Igor Alves Barros',
      'Marcos Túlio Costa',
      'Paulo Gonçalves Lopes',
      'Pedro Henrique Lima',
      'Pierre Campos Dias',
      'Otávio Miranda da Silva',
      'Roberto Carvalho Almeida',
      'Samuel Rodrigues Moreira',
      'Sara Raquel Duarte',
      'Vinícius Henrique Pereira',
      'Vitoria Amaral Rocha',
      'Wesley Medeiros da Cruz'
    ];
    List<String> images = [
      'https://img.freepik.com/vetores-premium/o-avatar-do-perfil-de-usuario-feminino-e-uma-mulher-um-personagem-para-um-protetor-de-tela-com-emocoes_505620-617.jpg?w=826',
      'https://i.pinimg.com/564x/a6/58/32/a65832155622ac173337874f02b218fb.jpg',
      'https://static.vecteezy.com/system/resources/previews/002/002/403/large_2x/man-with-beard-avatar-character-isolated-icon-free-vector.jpg',
      'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Image-File.png',
      'https://www.pngall.com/wp-content/uploads/5/User-Profile-Transparent.png',
      'https://www.pngall.com/wp-content/uploads/5/Profile-Transparent.png',
      'https://www.pngmart.com/files/21/Admin-Profile-PNG-Clipart.png',
      'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Photos.png',
      'https://www.pngmart.com/files/22/User-Avatar-Profile-PNG-Pic.png',
      'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Picture.png',
      'https://cdn3.iconfinder.com/data/icons/avatars-round-flat/33/avat-01-512.png',
      'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Image-File.png',
      'https://cdn1.iconfinder.com/data/icons/avatars-55/100/avatar_profile_user_music_headphones_shirt_cool-512.png',
      'https://dumbosdiary.com/wp-content/uploads/2017/04/minecraft_digital-paint_avatar.jpg',
      'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile.png',
      'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-PNG-Pic.png',
      'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-Vector-PNG-Images.png',
      'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-Vector-No-Background.png',
      'https://www.pngall.com/wp-content/uploads/12/Avatar-PNG-File.png',
      'https://www.pngall.com/wp-content/uploads/12/Avatar-Profile-Vector-PNG-File.png'
    ];
    var rng = Random();
    List.generate(
        20,
        (index) => list.add(StudentClassModel(
            name: names[index],
            grade1: (rng.nextInt(15) + 15).toString(),
            grade2: (rng.nextInt(15) + 15).toString(),
            grade3: '-',
            ciu: (80000 + index).toString(),
            imageProfile: images[index],
            isPresent1: true,
            isPresent2: true)));

    return list;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'ciu': ciu,
      'imageProfile': imageProfile,
      'isPresent1': isPresent1,
      'isPresent2': isPresent2,
    };
  }

  factory StudentClassModel.fromMap(Map<String, dynamic> map) {
    return StudentClassModel(
      name: map['name'] as String,
      ciu: map['ciu'] as String,
      grade1: map['grade1'] as String,
      grade2: map['grade2'] as String,
      grade3: map['grade3'] as String,
      imageProfile: map['imageProfile'] as String,
      isPresent1: map['isPresent1'] as bool,
      isPresent2: map['isPresent2'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentClassModel.fromJson(String source) =>
      StudentClassModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
