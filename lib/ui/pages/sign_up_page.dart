part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  User user;
  File file;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String image = 'https://static.asiachan.com/Lee.Soojin.full.250142.jpg';

  @override
  Widget build(BuildContext context) {
    return GeneralPages(
      onBack: () {
        Get.back();
      },
      title: 'Sign Up',
      subTitle: 'Register And Eat',
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              PickedFile pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                file = File(pickedFile.path);
                setState(() {});
              }
            },
            child: Container(
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
              child: (file != null)
                  ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: FileImage(file),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/photo.png'),
                          fit: BoxFit.cover,
                        ),
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
            obscure: true,
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
                Get.to(() => AddressPage(
                      user: User(name: nameController.text, email: emailController.text),
                      password: passwordController.text,
                      file: file,
                    ));
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
