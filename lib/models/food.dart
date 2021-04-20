part of 'models.dart';

enum FoodType { newFood, popular, recommended }

class Food extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rate;
  final List<FoodType> types;

  Food({
    this.id,
    this.picturePath,
    this.name,
    this.description,
    this.ingredients,
    this.price,
    this.rate,
    this.types = const [],
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      picturePath: json['picturePath'],
      name: json['name'],
      description: json['description'],
      ingredients: json['ingredients'],
      price: json['price'],
      rate: (json['rate'] as num).toDouble(),
      types: json['types'].toString().split(',').map((e) {
        switch (e) {
          case 'recommended':
            return FoodType.recommended;
            break;
          case 'popular':
            return FoodType.popular;
            break;
          default:
            return FoodType.newFood;
        }
      }).toList(),
    );
  }

  @override
  List<Object> get props => [
        id,
        picturePath,
        name,
        description,
        ingredients,
        price,
        rate,
        types,
      ];
}

List<Food> mockFoods = [
  Food(
    id: 1,
    picturePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ49_CV0pbbEzThC_Bg3aGuBh7j5snCzMpllg&usqp=CAU',
    name: 'Sate Maranggi semua',
    description: 'Makanan khas Bandung yang cukup sering dipesan oleh anak muda dengan pola makan yang cukup tinggi dengan mengutamakan diet yang sehat dan teratur.',
    ingredients: 'Bawang merah, daging, ketumbar, kecap',
    price: 150000,
    rate: 1,
    types: [FoodType.newFood, FoodType.popular, FoodType.recommended],
  ),
  Food(
    id: 1,
    picturePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ49_CV0pbbEzThC_Bg3aGuBh7j5snCzMpllg&usqp=CAU',
    name: 'Sate Maranggi',
    description: 'Makanan khas Bandung yang cukup sering dipesan oleh anak muda dengan pola makan yang cukup tinggi dengan mengutamakan diet yang sehat dan teratur.',
    ingredients: 'Bawang merah, daging, ketumbar, kecap',
    price: 150000,
    rate: 1,
  ),
  Food(
    id: 1,
    picturePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ49_CV0pbbEzThC_Bg3aGuBh7j5snCzMpllg&usqp=CAU',
    name: 'Sate Maranggi new food',
    description: 'Makanan khas Bandung yang cukup sering dipesan oleh anak muda dengan pola makan yang cukup tinggi dengan mengutamakan diet yang sehat dan teratur.',
    ingredients: 'Bawang merah, daging, ketumbar, kecap',
    price: 150000,
    rate: 1,
    types: [FoodType.newFood],
  ),
  Food(
    id: 1,
    picturePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ49_CV0pbbEzThC_Bg3aGuBh7j5snCzMpllg&usqp=CAU',
    name: 'Sate Maranggi recom ',
    description: 'Makanan khas Bandung yang cukup sering dipesan oleh anak muda dengan pola makan yang cukup tinggi dengan mengutamakan diet yang sehat dan teratur.',
    ingredients: 'Bawang merah, daging, ketumbar, kecap',
    price: 150000,
    rate: 1,
    types: [FoodType.recommended],
  ),
  Food(
    id: 1,
    picturePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ49_CV0pbbEzThC_Bg3aGuBh7j5snCzMpllg&usqp=CAU',
    name: 'Sate Maranggi popular',
    description: 'Makanan khas Bandung yang cukup sering dipesan oleh anak muda dengan pola makan yang cukup tinggi dengan mengutamakan diet yang sehat dan teratur.',
    ingredients: 'Bawang merah, daging, ketumbar, kecap',
    price: 150000,
    rate: 1,
    types: [FoodType.popular],
  ),
  Food(
    id: 1,
    picturePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ49_CV0pbbEzThC_Bg3aGuBh7j5snCzMpllg&usqp=CAU',
    name: 'Sate Maranggi',
    description: 'Makanan khas Bandung yang cukup sering dipesan oleh anak muda dengan pola makan yang cukup tinggi dengan mengutamakan diet yang sehat dan teratur.',
    ingredients: 'Bawang merah, daging, ketumbar, kecap',
    price: 150000,
    rate: 1,
  ),
  Food(
    id: 1,
    picturePath: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ49_CV0pbbEzThC_Bg3aGuBh7j5snCzMpllg&usqp=CAU',
    name: 'Sate Maranggi',
    description: 'Makanan khas Bandung yang cukup sering dipesan oleh anak muda dengan pola makan yang cukup tinggi dengan mengutamakan diet yang sehat dan teratur.',
    ingredients: 'Bawang merah, daging, ketumbar, kecap',
    price: 150000,
    rate: 1,
  ),
];
