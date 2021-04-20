part of 'models.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String address;
  final String houseNumber;
  final String phoneNumber;
  final String city;
  final String picturePath;
  static String token;

  User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.houseNumber,
    this.phoneNumber,
    this.city,
    this.picturePath,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      address: json['address'],
      houseNumber: json['houseNumber'],
      phoneNumber: json['phoneNumber'],
      city: json['city'],
      picturePath: json['profile_photo_url'],
    );
  }

// untuk mengupdate
  User copyWith({
    int id,
    String name,
    String email,
    String address,
    String houseNumber,
    String phoneNumber,
    String city,
    String picturePath,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      houseNumber: houseNumber ?? this.houseNumber,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      city: city ?? this.city,
      picturePath: picturePath ?? this.picturePath,
    );
  }

  @override
  List<Object> get props => [id, name, email, address, houseNumber, phoneNumber, city, picturePath];
}

User mockUser = User(
  id: 1,
  name: 'Lee Soojin',
  email: 'LeeSoojin@gmail.com',
  address: 'Jalan Hatiku kecamatan nathan',
  houseNumber: 'Nomer 07',
  phoneNumber: '0777712812',
  city: 'Bandung',
  picturePath: 'https://static.asiachan.com/Lee.Soojin.full.250142.jpg',
);
