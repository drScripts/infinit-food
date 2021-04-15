part of 'pages.dart';

class SignInPage extends StatefulWidget {
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController(text: "");
    TextEditingController passwordController = TextEditingController(text: "");
    bool isLoading = false;

    return GeneralPages(
      title: 'Sign In',
      subTitle: 'Find your best ever meal',
      child: Column(
        children: [
          InputTextWidget(
            title: 'Email Address',
            label: 'Type your email address',
            emailController: emailController,
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
            child: isLoading
                ? SpinKitFadingCircle(
                    size: 45,
                    color: mainColorAmber,
                  )
                : ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: mainColorAmber,
                      minimumSize: Size(double.infinity, 60),
                    ),
                    child: Text(
                      'Sign In',
                      style: blackFontStyle1,
                    ),
                  ),
          ),
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: TextButton(
              onPressed: () {
                Get.to(() => SignUpPage());
              },
              child: Text(
                'Create New Account',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: lightGreyColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
