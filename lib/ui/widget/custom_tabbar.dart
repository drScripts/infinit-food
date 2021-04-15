part of 'widget.dart';

class CustomTabBar extends StatelessWidget {
  final int selectedIndex;
  final List<String> title;
  final Function(int index) onTap;

  CustomTabBar({
    this.selectedIndex,
    @required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 48),
            height: 2,
            color: Color(0xffF2F2F2),
          ),
          Row(
            children: title
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.only(left: defaultMargin),
                    child: GestureDetector(
                      onTap: () {
                        if (onTap != null) {
                          onTap(title.indexOf(e));
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            e,
                            style: (title.indexOf(e) == selectedIndex)
                                ? blackFontStyle3.copyWith(
                                    fontWeight: FontWeight.w500)
                                : greyFontStyle,
                          ),
                          Container(
                            width: 40,
                            height: 3,
                            margin: EdgeInsets.only(top: 13),
                            decoration: BoxDecoration(
                              color: (title.indexOf(e) == selectedIndex)
                                  ? Colors.black
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
