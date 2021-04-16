part of 'widget.dart';

class ProfileAppList extends StatelessWidget {
  final String title;
  final Function onTap;
  ProfileAppList({
    @required this.title,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: blackFontStyle2.copyWith(
                fontSize: 14, fontWeight: FontWeight.w500),
          ),
          IconButton(
            onPressed: onTap,
            icon: FaIcon(FontAwesomeIcons.angleRight),
          ),
        ],
      ),
    );
  }
}
