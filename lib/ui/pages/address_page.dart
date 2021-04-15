part of 'pages.dart';

class AddressPage extends StatefulWidget {
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController(text: "");
    TextEditingController addressController = TextEditingController(text: "");
    TextEditingController houseNumberController =
        TextEditingController(text: "");
    bool isLoading = false;

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
          ),
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
                    onPressed: () {},
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
