part of 'pages.dart';

class FoodDetail extends StatefulWidget {
  final Function onBack;
  final Transaction transaction;
  FoodDetail({this.onBack, this.transaction});

  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: mainColorAmber,
          ),
          SafeArea(
            child: Container(color: Colors.white),
          ),
          SafeArea(
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.transaction.food.picturePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SafeArea(
            child: ListView(children: [
              Column(
                children: [
                  //// Back Button,
                  Container(
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          if (widget.onBack != null) {
                            widget.onBack();
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.all(3),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black12,
                          ),
                          child: Image.asset('assets/back_arrow_white.png'),
                        ),
                      ),
                    ),
                  ),

                  //// Body
                  Container(
                    margin: EdgeInsets.only(top: 180),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: margin26,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(children: [
                      //// Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //// Name + rating
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width -
                                    32 -
                                    120,
                                child: Text(
                                  widget.transaction.food.name,
                                  style: blackFontStyle2,
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              RatingStars(
                                rating: widget.transaction.food.rate,
                              ),
                            ],
                          ),
                          //// quantity button
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity = max(0, quantity - 1);
                                  });
                                },
                                child: Container(
                                  width: 26,
                                  height: 26,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.black, width: 1),
                                    image: DecorationImage(
                                      image: AssetImage('assets/btn_min.png'),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(quantity.toString(),
                                    style: blackFontStyle2),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity = min(29, quantity + 1);
                                  });
                                },
                                child: Container(
                                  width: 26,
                                  height: 26,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: Colors.black, width: 1),
                                    image: DecorationImage(
                                      image: AssetImage('assets/btn_add.png'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      //// description
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          widget.transaction.food.description,
                          style: greyFontStyle,
                        ),
                      ),
                      //// ingredients
                      //// Judul Ingredients
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 4),
                          child: Text(
                            'Ingredients',
                            style: blackFontStyle2,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      //// isi Ingredients
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 40),
                          child: Text(widget.transaction.food.ingredients,
                              style: greyFontStyle),
                        ),
                      ),
                      //// totalPrice + BUtton
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //// total price
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Total Price:',
                                style: greyFontStyle.copyWith(fontSize: 13),
                              ),
                              Text(
                                NumberFormat.currency(
                                        locale: 'id',
                                        decimalDigits: 0,
                                        symbol: 'IDR ')
                                    .format(quantity *
                                        widget.transaction.food.price),
                                style: blackFontStyle2.copyWith(fontSize: 18),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: (quantity < 1) ? null : () {},
                            style: ElevatedButton.styleFrom(
                              onSurface: mainColorAmber,
                              primary: mainColorAmber,
                              minimumSize: Size(163, 45),
                              shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Order Now',
                              style: blackFontStyle3.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
