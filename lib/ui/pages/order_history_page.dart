part of 'pages.dart';

class OrderHistoryPage extends StatefulWidget {
  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0;
  List<Transaction> inprogress = mockTransaction
      .where((element) =>
          element.status == TransactionStatus.onDelivery ||
          element.status == TransactionStatus.pending)
      .toList();
  List<Transaction> recent = mockTransaction
      .where((element) =>
          element.status == TransactionStatus.cancel ||
          element.status == TransactionStatus.delivered)
      .toList();
  @override
  Widget build(BuildContext context) {
    if ((inprogress.length == 0 && recent.length == 0)) {
      return Center(
        child: IllustrationPage(
          title: 'Ouch! Hungry',
          subtitle: 'Seems like you have not\nordered any food yet',
          imagePath: 'assets/love_burger.png',
          buttonTitle1: 'Find Foods',
          onTap1: () {},
        ),
      );
    } else {
      double listItemWidth =
          MediaQuery.of(context).size.width - 2 * defaultMargin;
      return ListView(
        children: [
          Column(
            children: [
              //// Header
              Container(
                height: 120,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: defaultMargin),
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Text(
                        'Your Orders',
                        style: blackFontStyle2.copyWith(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: defaultMargin),
                      child: Text(
                        'Wait for the best meal',
                        style: greyFontStyle.copyWith(
                          fontSize: 14,
                          fontWeight: lightFontWeight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //// body
              Container(
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  children: [
                    CustomTabBar(
                      title: ['In Progress', 'Recent Orders'],
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
                    Column(
                      children: (selectedIndex == 0 ? inprogress : recent)
                          .map((e) => Padding(
                                padding: EdgeInsets.only(
                                  left: defaultMargin,
                                  bottom: 16,
                                  right: defaultMargin,
                                ),
                                child: OrderListItem(
                                  transaction: e,
                                  itemWidth: listItemWidth,
                                ),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    }
  }
}
