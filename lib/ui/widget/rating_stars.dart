part of 'widget.dart';

class RatingStars extends StatelessWidget {
  final double rating;

  RatingStars({this.rating});
  @override
  Widget build(BuildContext context) {
    int numberOfStars = rating.round();
    return Row(
      children: List<Widget>.generate(
            5,
            (index) => Icon(
              (index < numberOfStars) ? MdiIcons.star : MdiIcons.starOutline,
              size: 16,
              color: mainColorAmber,
            ),
          ) +
          [
            SizedBox(
              width: 4,
            ),
            Text(
              rating.toString(),
              style: greyFontStyle,
            ),
          ],
    );
  }
}
