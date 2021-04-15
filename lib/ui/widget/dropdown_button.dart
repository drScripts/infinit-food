part of 'widget.dart';

class DropDownButtonWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  DropDownButtonWidget({
    @required this.title,
    @required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(
            defaultMargin,
            16,
            defaultMargin,
            6,
          ),
          child: Text(
            title,
            style: blackFontStyle2,
          ),
        ),
        Container(
          height: 60,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 15),
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultRadius),
            border: Border.all(color: Colors.grey),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              onChanged: (item) {},
              icon: FaIcon(FontAwesomeIcons.angleDown),
              hint: Text(
                subtitle,
                style: greyFontStyle.copyWith(fontSize: 18),
              ),
              items: [
                DropdownMenuItem(
                  child: Text(
                    'Bandung',
                    style: blackFontStyle3,
                  ),
                ),
                DropdownMenuItem(
                  child: Text(
                    'Jakarta',
                    style: blackFontStyle3,
                  ),
                ),
                DropdownMenuItem(
                  child: Text(
                    'Surabaya',
                    style: blackFontStyle3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
