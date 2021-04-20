part of 'pages.dart';

class SignInPage extends StatefulWidget {
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
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
            obscure: true,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: isLoading
                ? loadingIndicator
                : ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await context.read<UserCubit>().signIn(emailController.text, passwordController.text);

                      //  mengambil state yang sedang berjalan
                      UserState state = context.read<UserCubit>().state;
                      // memeriksa state yang terjadi
                      if (state is UserLoaded) {
                        context.read<FoodCubit>().getFood();
                        context.read<TransactionCubit>().getTransaction();
                        Get.offAll(() => MainPage());
                      } else {
                        Get.snackbar(
                          "",
                          "",
                          backgroundColor: Colors.pink,
                          icon: Icon(
                            MdiIcons.closeCircleOutline,
                            color: Colors.white,
                          ),
                          titleText: Text(
                            'Sign In Failed',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          messageText: Text(
                            (state as UserLoadingFailed).message,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                            ),
                          ),
                        );
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },
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
