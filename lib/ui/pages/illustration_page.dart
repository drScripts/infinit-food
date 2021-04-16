part of 'pages.dart';

class IllustrationPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final String buttonTitle1;
  final String buttonTitle2;
  final Function onTap1;
  final Function onTap2;

  IllustrationPage(
      {@required this.title,
      @required this.subtitle,
      @required this.imagePath,
      @required this.buttonTitle1,
      this.buttonTitle2,
      @required this.onTap1,
      this.onTap2});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 230,
            height: 230,
            margin: EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 6),
            child: Text(
              title,
              style: blackFontStyle1.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Text(
              subtitle,
              style: greyFontStyle.copyWith(
                fontSize: 14,
                fontWeight: lightFontWeight,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          ElevatedButton(
            onPressed: onTap1,
            style: ElevatedButton.styleFrom(
              primary: mainColorAmber,
              minimumSize: Size(200, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              buttonTitle1,
              style: blackFontStyle2.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ),
          if (buttonTitle2 != null)
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: ElevatedButton(
                onPressed: () {
                  if (onTap2 != null) onTap2;
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xff8D92A3),
                  minimumSize: Size(200, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  buttonTitle2,
                  style: blackFontStyle2.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
