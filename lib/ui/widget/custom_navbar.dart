part of 'widget.dart';

class CustomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) itemOnSelect;
  CustomNavbar({
    this.selectedIndex = 0,
    this.itemOnSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              if (itemOnSelect != null) {
                itemOnSelect(0);
              }
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/ic_home' +
                        ((selectedIndex == 0) ? '.png' : '_normal.png'),
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (itemOnSelect != null) {
                itemOnSelect(1);
              }
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/ic_order' +
                        ((selectedIndex == 1) ? '.png' : '_normal.png'),
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (itemOnSelect != null) {
                itemOnSelect(2);
              }
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/ic_profile' +
                        ((selectedIndex == 2) ? '.png' : '_normal.png'),
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
