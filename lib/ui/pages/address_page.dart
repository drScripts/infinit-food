part of 'pages.dart';

class AddressPage extends StatefulWidget {
  final User user;
  final String password;
  final File file;
  AddressPage({this.user, this.password, this.file});
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  bool isLoading = false;

  List<String> cities;
  String selectedCity;

  @override
  void initState() {
    super.initState();

    cities = ['Bandung', 'Jakarta', 'Surabaya', 'Madura'];
    selectedCity = cities[0];
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPages(
      onBack: () {
        Get.back();
      },
      title: 'Address',
      subTitle: "Make sure it's valid",
      child: Column(
        children: [
          InputTextWidget(
            title: 'Phone No.',
            label: 'Type your phone number',
            emailController: phoneController,
          ),
          InputTextWidget(
            title: 'Address',
            label: 'Type your address',
            emailController: addressController,
            marginTop: 16,
          ),
          InputTextWidget(
            title: 'House No.',
            label: 'Type your house number',
            emailController: houseNumberController,
            marginTop: 16,
          ),
          DropDownButtonWidget(
              title: 'City',
              subtitle: 'Select Your City',
              cities: cities,
              selectedCity: selectedCity,
              onChange: (index) {
                setState(() {
                  selectedCity = index;
                });
              }),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: margin26),
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: isLoading
                ? SpinKitFadingCircle(
                    size: 45,
                    color: mainColorAmber,
                  )
                : ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });

                      User user = widget.user.copyWith(
                        phoneNumber: phoneController.text,
                        houseNumber: houseNumberController.text,
                        address: addressController.text,
                        city: selectedCity,
                      );
                      await context.read<UserCubit>().signUp(user, widget.password, pictureFile: widget.file);
                      UserState state = context.read<UserCubit>().state;

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
                      'Sign Up',
                      style: blackFontStyle1,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
