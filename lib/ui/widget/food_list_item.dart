part of 'widget.dart';

class FoodListItem extends StatelessWidget {
  final Food food;
  final double itemWidth;

  FoodListItem({this.food, this.itemWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(food.picturePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: itemWidth - 182, // 60 + 12 + 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                food.name,
                style: blackFontStyle2,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                NumberFormat.currency(
                        locale: 'id', decimalDigits: 0, symbol: 'Rp. ')
                    .format(food.price),
                style: greyFontStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
        RatingStars(
          rating: food.rate,
        ),
      ],
    );
  }
}
