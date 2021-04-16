part of 'pages.dart';

class SuccessSignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IllustrationPage(
        title: 'Yeay! Completed',
        subtitle: 'Now you are able to order\nsome foods as a self-reward',
        imagePath: 'assets/food_wishes.png',
        buttonTitle1: 'Find Foods',
        onTap1: () {},
      ),
    );
  }
}
