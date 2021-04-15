part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
            child: Container(
              color: Color(0xffFAFAFC),
            ),
          ),

          //// Body
          SafeArea(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedPage = index;
                });
              },
              children: [
                FoodPage(),
                Center(
                  child: Text('Body1'),
                ),
                Center(
                  child: Text('Body2'),
                ),
              ],
            ),
          ),

          //// Navigation Bar
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomNavbar(
              selectedIndex: selectedPage,
              itemOnSelect: (index) {
                setState(() {
                  selectedPage = index;
                });
                pageController.jumpToPage(selectedPage);
              },
            ),
          ),
        ],
      ),
    );
  }
}
