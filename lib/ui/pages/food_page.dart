part of 'pages.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  String image = 'https://static.asiachan.com/Lee.Soojin.full.250142.jpg';

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    double listItemWidth =
        MediaQuery.of(context).size.width - (2 * defaultMargin);

    return ListView(
      children: [
        Column(
          children: [
            //// Header
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              color: Colors.white,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('FoodMarket', style: blackFontStyle1),
                      Text(
                        "Let's get some foods",
                        style: greyFontStyle,
                      )
                    ],
                  ),
                  Container(
                    width: 65,
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //// List food
            Container(
              height: 258,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: mockFoods
                        .map((e) => Padding(
                              padding: EdgeInsets.only(
                                left:
                                    (e == mockFoods.first) ? defaultMargin : 8,
                                right: defaultMargin,
                              ),
                              child: FoodCard(food: e),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
            //// TabBar foods
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  CustomTabBar(
                    title: ['New Taste', 'Popular', 'Recommended'],
                    selectedIndex: selectedIndex,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Builder(builder: (_) {
                    List<Food> foods = (selectedIndex == 0)
                        ? mockFoods
                        : (selectedIndex == 1)
                            ? []
                            : [];
                    return Column(
                      children: foods
                          .map((e) => Padding(
                                padding: EdgeInsets.fromLTRB(
                                    defaultMargin, 0, defaultMargin, 16),
                                child: FoodListItem(
                                  food: e,
                                  itemWidth: listItemWidth,
                                ),
                              ))
                          .toList(),
                    );
                  }),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ],
    );
  }
}
