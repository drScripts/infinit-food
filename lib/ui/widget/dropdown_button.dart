part of 'widget.dart';

class DropDownButtonWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<String> cities;
  final String selectedCity;
  final Function(dynamic index) onChange;
  DropDownButtonWidget({
    @required this.title,
    @required this.subtitle,
    this.cities,
    this.selectedCity,
    this.onChange,
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
              value: selectedCity,
              isExpanded: true,
              onChanged: onChange,
              icon: FaIcon(FontAwesomeIcons.angleDown),
              items: List.generate(cities.length, (index) {
                return DropdownMenuItem(
                  value: cities[index],
                  child: Text(
                    cities[index],
                    style: blackFontStyle3,
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
