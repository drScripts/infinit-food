part of 'pages.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    String image = (context.watch<UserCubit>().state as UserLoaded).user.picturePath ?? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPD3DoQ3wJWAsYI59OuQMCI7zI8Xri7oQoMQ&usqp=CAU';
    double listItemWidth = MediaQuery.of(context).size.width - (2 * defaultMargin);
    // print(image);

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
              child: BlocBuilder<FoodCubit, FoodState>(
                builder: (_, state) => (state is FoodLoaded)
                    ? ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: state.food
                                .map((e) => Padding(
                                      padding: EdgeInsets.only(
                                        left: (e == state.food.first) ? defaultMargin : 8,
                                        right: defaultMargin,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(
                                            () => FoodDetail(
                                              onBack: () {
                                                Get.back();
                                              },
                                              transaction: Transaction(
                                                food: e,
                                                user: (context.watch<UserCubit>().state as UserLoaded).user,
                                              ),
                                            ),
                                          );
                                        },
                                        child: FoodCard(food: e),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ],
                      )
                    : Center(
                        child: loadingIndicator,
                      ),
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
                  BlocBuilder<FoodCubit, FoodState>(
                    builder: (_, state) {
                      if (state is FoodLoaded) {
                        List<Food> foods = state.food
                            .where(
                              (element) => element.types.contains(
                                (selectedIndex == 0)
                                    ? FoodType.newFood
                                    : (selectedIndex == 1)
                                        ? FoodType.popular
                                        : FoodType.recommended,
                              ),
                            )
                            .toList();
                        return Column(
                          children: foods
                              .map((e) => Padding(
                                    padding: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 16),
                                    child: FoodListItem(
                                      food: e,
                                      itemWidth: listItemWidth,
                                    ),
                                  ))
                              .toList(),
                        );
                      } else {
                        return Center(
                          child: loadingIndicator,
                        );
                      }
                    },
                  ),
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
