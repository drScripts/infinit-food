part of 'models.dart';

class Food extends Equatable {
  final int id;
  final String picturePath;
  final String name;
  final String description;
  final String ingredients;
  final int price;
  final double rate;

  Food({
    this.id,
    this.picturePath,
    this.name,
    this.description,
    this.ingredients,
    this.price,
    this.rate,
  });

  @override
  List<Object> get props => [
        id,
        picturePath,
        name,
        description,
        ingredients,
        price,
        rate,
      ];
}

List<Food> mockFoods = [
  Food(
    id: 1,
    picturePath:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ49_CV0pbbEzThC_Bg3aGuBh7j5snCzMpllg&usqp=CAU',
    name: 'Sate Maranggi',
    description:
        'Makanan khas Bandung yang cukup sering dipesan oleh anak muda dengan pola makan yang cukup tinggi dengan mengutamakan diet yang sehat dan teratur.',
    ingredients: 'Bawang merah, daging, ketumbar, kecap',
    price: 150000,
    rate: 4.2,
  ),
  Food(
    id: 1,
    picturePath:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ49_CV0pbbEzThC_Bg3aGuBh7j5snCzMpllg&usqp=CAU',
    name: 'Sate Maranggi',
    description:
        'Makanan khas Bandung yang cukup sering dipesan oleh anak muda dengan pola makan yang cukup tinggi dengan mengutamakan diet yang sehat dan teratur.',
    ingredients: 'Bawang merah, daging, ketumbar, kecap',
    price: 150000,
    rate: 4.2,
  ),
  Food(
    id: 1,
    picturePath:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ49_CV0pbbEzThC_Bg3aGuBh7j5snCzMpllg&usqp=CAU',
    name: 'Sate Maranggi',
    description:
        'Makanan khas Bandung yang cukup sering dipesan oleh anak muda dengan pola makan yang cukup tinggi dengan mengutamakan diet yang sehat dan teratur.',
    ingredients: 'Bawang merah, daging, ketumbar, kecap',
    price: 150000,
    rate: 4.2,
  ),
  Food(
    id: 1,
    picturePath:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ49_CV0pbbEzThC_Bg3aGuBh7j5snCzMpllg&usqp=CAU',
    name: 'Sate Maranggi',
    description:
        'Makanan khas Bandung yang cukup sering dipesan oleh anak muda dengan pola makan yang cukup tinggi dengan mengutamakan diet yang sehat dan teratur.',
    ingredients: 'Bawang merah, daging, ketumbar, kecap',
    price: 150000,
    rate: 4.2,
  ),
  Food(
    id: 1,
    picturePath:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ49_CV0pbbEzThC_Bg3aGuBh7j5snCzMpllg&usqp=CAU',
    name: 'Sate Maranggi',
    description:
        'Makanan khas Bandung yang cukup sering dipesan oleh anak muda dengan pola makan yang cukup tinggi dengan mengutamakan diet yang sehat dan teratur.',
    ingredients: 'Bawang merah, daging, ketumbar, kecap',
    price: 150000,
    rate: 4.2,
  ),
  Food(
    id: 1,
    picturePath:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ49_CV0pbbEzThC_Bg3aGuBh7j5snCzMpllg&usqp=CAU',
    name: 'Sate Maranggi',
    description:
        'Makanan khas Bandung yang cukup sering dipesan oleh anak muda dengan pola makan yang cukup tinggi dengan mengutamakan diet yang sehat dan teratur.',
    ingredients: 'Bawang merah, daging, ketumbar, kecap',
    price: 150000,
    rate: 4.2,
  ),
  Food(
    id: 1,
    picturePath:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ49_CV0pbbEzThC_Bg3aGuBh7j5snCzMpllg&usqp=CAU',
    name: 'Sate Maranggi',
    description:
        'Makanan khas Bandung yang cukup sering dipesan oleh anak muda dengan pola makan yang cukup tinggi dengan mengutamakan diet yang sehat dan teratur.',
    ingredients: 'Bawang merah, daging, ketumbar, kecap',
    price: 150000,
    rate: 4.2,
  ),
];
