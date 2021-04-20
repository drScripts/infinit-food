part of 'pages.dart';

class PaymentPage extends StatelessWidget {
  final String paymentUrl;
  PaymentPage({this.paymentUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IllustrationPage(
        title: "Finish Your Payment",
        subtitle: 'Please Select Your Favorite\nPayment Method',
        imagePath: 'assets/Payment.png',
        buttonTitle1: 'Payment Method',
        onTap1: () async {
          await launch(paymentUrl);
        },
        buttonTitle2: 'Continue',
        onTap2: () {
          Get.offAll(() => SuccessOrderPage());
        },
      ),
    );
  }
}
