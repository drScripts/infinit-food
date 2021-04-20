part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int initialPage;
  MainPage({this.initialPage = 0});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    
    super.initState();
    selectedPage = widget.initialPage;
    pageController = PageController(initialPage: selectedPage);
  }

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
                OrderHistoryPage(),
                ProfilePage(
                  user: mockUser,
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
