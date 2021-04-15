part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(text: "");
    TextEditingController passwordController = TextEditingController(text: "");
    TextEditingController nameController = TextEditingController(text: "");
    String image = 'https://static.asiachan.com/Lee.Soojin.full.250142.jpg';

    return GeneralPages(
      onBack: () {
        Get.back();
      },
      title: 'Sign Up',
      subTitle: 'Register And Eat',
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.only(top: margin26),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/photo_border.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: image != null
                      ? NetworkImage(image)
                      : AssetImage('assets/photo.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          InputTextWidget(
            title: 'Your Full Name',
            label: 'Type your ull name',
            emailController: nameController,
            marginTop: 16,
          ),
          InputTextWidget(
            title: 'Email Address',
            label: 'Type your email address',
            emailController: emailController,
            marginTop: 16,
          ),
          InputTextWidget(
            title: 'Password',
            label: 'Type your password',
            emailController: passwordController,
            marginTop: 16,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => AddressPage());
              },
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                primary: mainColorAmber,
                minimumSize: Size(double.infinity, 60),
              ),
              child: Text(
                'Continue',
                style: blackFontStyle1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
