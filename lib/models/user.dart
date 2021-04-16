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

  @override
  List<Object> get props =>
      [id, name, email, address, houseNumber, phoneNumber, city, picturePath];
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
