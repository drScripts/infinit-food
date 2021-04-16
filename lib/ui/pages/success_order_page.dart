part of 'pages.dart';

class SuccessOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IllustrationPage(
        title: "You’ve Made Order",
        subtitle: 'Just stay at home while we are\npreparing your best foods',
        imagePath: 'assets/bike.png',
        buttonTitle1: 'Order Other Foods',
        onTap1: () {},
        buttonTitle2: 'View My Order',
        onTap2: () {},
      ),
    );
  }
}
