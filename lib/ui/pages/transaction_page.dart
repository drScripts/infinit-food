part of 'pages.dart';

class TransactionPage extends StatefulWidget {
  final Function onBack;
  final Transaction transaction;

  TransactionPage({this.onBack, this.transaction});
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GeneralPages(
          onBack: () {
            if (widget.onBack != null) {
              widget.onBack();
            }
          },
          title: 'Payment',
          subTitle: 'You deserve better meal',
          backColor: Color(0xffFAFAFC),
          child: Column(
            children: [
              //// bagian atas
              Container(
                margin: EdgeInsets.only(bottom: defaultMargin),
                padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin, vertical: 16),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: Text('Item Ordered', style: blackFontStyle3),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              margin: EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      widget.transaction.food.picturePath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width -
                                      48 -
                                      60 -
                                      100,
                                  child: Text(
                                    widget.transaction.food.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.clip,
                                    style:
                                        blackFontStyle3.copyWith(fontSize: 16),
                                  ),
                                ),
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id',
                                          decimalDigits: 0,
                                          symbol: 'IDR ')
                                      .format(widget.transaction.food.price),
                                  style: greyFontStyle.copyWith(fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          '${widget.transaction.quantity} items',
                          style: greyFontStyle.copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                    //// Detail Transaction
                    Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 8),
                      child: Text(
                        'Details Transaction',
                        style: blackFontStyle3.copyWith(fontSize: 14),
                      ),
                    ),
                    //// makanan
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            widget.transaction.food.name,
                            style: greyFontStyle.copyWith(fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2 -
                              defaultMargin -
                              5,
                          child: Text(
                            NumberFormat.currency(
                                    locale: 'id',
                                    decimalDigits: 0,
                                    symbol: 'IDR ')
                                .format((widget.transaction.food.price) *
                                    widget.transaction.quantity),
                            style: blackFontStyle3.copyWith(fontSize: 14),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    //// driver
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Driver',
                          style: greyFontStyle.copyWith(fontSize: 14),
                        ),
                        Text(
                          NumberFormat.currency(
                                  locale: 'id',
                                  decimalDigits: 0,
                                  symbol: 'IDR ')
                              .format(50000),
                          style: blackFontStyle3.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),

                    //// Tax
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tax 10%',
                          style: greyFontStyle.copyWith(fontSize: 14),
                        ),
                        Text(
                          NumberFormat.currency(
                                  locale: 'id',
                                  decimalDigits: 0,
                                  symbol: 'IDR ')
                              .format((widget.transaction.food.price *
                                  widget.transaction.quantity *
                                  0.1)),
                          style: blackFontStyle3.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 6, bottom: 3),
                          width: double.infinity,
                          height: 1,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ],
                    ),

                    //// Total price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Price',
                          style: greyFontStyle.copyWith(
                              fontSize: 14, color: Color(0xff1ABC9C)),
                        ),
                        Text(
                          NumberFormat.currency(
                                  locale: 'id',
                                  decimalDigits: 0,
                                  symbol: 'IDR ')
                              .format(
                            (widget.transaction.food.price *
                                    widget.transaction.quantity *
                                    0.1) +
                                50000 +
                                (widget.transaction.food.price *
                                    widget.transaction.quantity),
                          ),
                          style: blackFontStyle3.copyWith(
                            fontSize: 14,
                            color: Color(0xff1ABC9C),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //// bagian 2
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: 16, horizontal: defaultMargin),
                margin: EdgeInsets.only(bottom: defaultMargin),
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Deliver to:',
                        style: blackFontStyle1.copyWith(fontSize: 14),
                      ),
                    ),
                    //// name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) -
                              (defaultMargin * 2),
                          child: Text(
                            'Name',
                            style: greyFontStyle.copyWith(fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) -
                              (defaultMargin * 2),
                          child: Text(
                            widget.transaction.user.name,
                            style: blackFontStyle2.copyWith(fontSize: 14),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    //// phone Number
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) -
                              (defaultMargin * 2),
                          child: Text(
                            'Phone No.',
                            style: greyFontStyle.copyWith(fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) -
                              (defaultMargin * 2),
                          child: Text(
                            widget.transaction.user.phoneNumber,
                            style: blackFontStyle2.copyWith(fontSize: 14),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    //// address
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) -
                              (defaultMargin * 2),
                          child: Text(
                            'Address',
                            style: greyFontStyle.copyWith(fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) -
                              (defaultMargin * 2),
                          child: Text(
                            widget.transaction.user.address,
                            style: blackFontStyle2.copyWith(fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    //// House Number
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) -
                              (defaultMargin * 2),
                          child: Text(
                            'House No.',
                            style: greyFontStyle.copyWith(fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) -
                              (defaultMargin * 2),
                          child: Text(
                            widget.transaction.user.houseNumber,
                            style: blackFontStyle2.copyWith(fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    //// City
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) -
                              (defaultMargin * 2),
                          child: Text(
                            'City',
                            style: greyFontStyle.copyWith(fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          width: (MediaQuery.of(context).size.width / 2) -
                              (defaultMargin * 2),
                          child: Text(
                            widget.transaction.user.city,
                            style: blackFontStyle2.copyWith(fontSize: 14),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        //// Button
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: defaultMargin + 6),
            child: (isLoading)
                ? SpinKitFadingCircle(
                    color: mainColorAmber,
                  )
                : ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(312, 45),
                      primary: Color(0xffFFC700),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Checkout Now',
                      style: blackFontStyle2.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
