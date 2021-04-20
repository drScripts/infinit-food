part of 'widget.dart';

class InputTextWidget extends StatelessWidget {
  final String title;
  final String label;
  final TextEditingController emailController;
  final double marginTop;
  final bool obscure;
  InputTextWidget({
    @required this.title,
    @required this.label,
    @required this.emailController,
    this.marginTop,
    this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(
            defaultMargin,
            marginTop ?? margin26,
            defaultMargin,
            6,
          ),
          child: Text(
            title,
            style: blackFontStyle2,
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: TextField(
            obscureText: (obscure == null) ? false : obscure,
            controller: emailController,
            decoration: InputDecoration(
              hintText: label,
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 10),
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
