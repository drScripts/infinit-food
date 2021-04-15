part of 'pages.dart';

class GeneralPages extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function onBack;
  final Widget child;
  final Color backColor;

  GeneralPages({
    @required this.title,
    @required this.subTitle,
    @required this.child,
    this.onBack,
    this.backColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              color: backColor ?? Colors.white,
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      width: double.infinity,
                      height: 100,
                      color: Colors.white,
                      child: Row(
                        children: [
                          onBack != null
                              ? GestureDetector(
                                  onTap: onBack,
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    margin: EdgeInsets.only(right: margin26),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage('assets/back_arrow.png'),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title,
                                style: GoogleFonts.poppins(
                                  fontSize: 22,
                                  fontWeight: mediumFontWeight,
                                ),
                              ),
                              Text(
                                subTitle,
                                style: GoogleFonts.poppins(
                                  color: lightGreyColor,
                                  fontWeight: lightFontWeight,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: defaultMargin,
                      color: Color(0xffFAFAFC),
                    ),
                    child ?? SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
