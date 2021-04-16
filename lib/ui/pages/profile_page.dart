part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  ProfilePage({this.user});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<ProfileAppList> accountSetting = [
    ProfileAppList(title: 'Edit Profile', onTap: () {}),
    ProfileAppList(title: 'Home Address', onTap: () {}),
    ProfileAppList(title: 'Security', onTap: () {}),
    ProfileAppList(title: 'Payments', onTap: () {}),
  ];
  List<ProfileAppList> appSetting = [
    ProfileAppList(title: 'Rate App', onTap: () {}),
    ProfileAppList(title: 'Help Center', onTap: () {}),
    ProfileAppList(title: 'Privacy & Policy', onTap: () {}),
    ProfileAppList(title: 'Terms & Conditions', onTap: () {}),
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            //// Header Profile
            Container(
              color: Colors.white,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 26),
              margin: EdgeInsets.only(bottom: defaultMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    //// picture profile
                    width: 150,
                    height: 150,
                    margin: EdgeInsets.only(bottom: 16),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/photo_border.png'),
                      ),
                    ),
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(widget.user.picturePath),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 6),
                    child: Text(
                      widget.user.name,
                      style: blackFontStyle1.copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text(
                      widget.user.email,
                      style: greyFontStyle.copyWith(fontSize: 19),
                    ),
                  ),
                ],
              ),
            ),
            //// body
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  CustomTabBar(
                    title: ['Account', 'FoodMarket'],
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
                    children:
                        (selectedIndex == 0 ? accountSetting : appSetting),
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
