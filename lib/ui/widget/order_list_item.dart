part of 'widget.dart';

class OrderListItem extends StatelessWidget {
  final Transaction transaction;
  final double itemWidth;

  OrderListItem({this.transaction, this.itemWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          margin: EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage(transaction.food.picturePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: itemWidth - 182, // 60 + 12 + 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.food.name,
                style: blackFontStyle2,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
              Text(
                '${transaction.quantity} item(s) • ' +
                    NumberFormat.currency(
                            locale: 'id', decimalDigits: 0, symbol: 'IDR ')
                        .format(transaction.total),
                style: greyFontStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
        //// tailing
        SizedBox(
          width: 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                convertDatetime(transaction.time),
                style: greyFontStyle.copyWith(fontSize: 10),
              ),
              SizedBox(
                height: 2,
              ),
              statusCheck(transaction.status),
            ],
          ),
        ),
      ],
    );
  }

  Text statusCheck(TransactionStatus status) {
    switch (status) {
      case TransactionStatus.cancel:
        return Text(
          'Canceled',
          style: greyFontStyle.copyWith(color: Colors.red, fontSize: 10),
        );
        break;
      case TransactionStatus.delivered:
        return Text(
          'Success',
          style: greyFontStyle.copyWith(color: Colors.green, fontSize: 10),
        );
        break;
      case TransactionStatus.pending:
        return Text(
          'Pending',
          style: greyFontStyle.copyWith(color: mainColorAmber, fontSize: 10),
        );
        break;
      default:
        return Text(
          'On Delivery',
          style: greyFontStyle.copyWith(
              color: Colors.deepOrange[100], fontSize: 10),
        );
        break;
    }
  }

  String convertDatetime(DateTime time) {
    String month;

    switch (time.month) {
      case 1:
        month = 'Jan';
        break;
      case 2:
        month = 'Feb';
        break;
      case 3:
        month = 'Mar';
        break;
      case 4:
        month = 'Apr';
        break;
      case 5:
        month = 'May';
        break;
      case 6:
        month = 'Jun';
        break;
      case 7:
        month = 'Jul';
        break;
      case 8:
        month = 'Aug';
        break;
      case 9:
        month = 'Sep';
        break;
      case 10:
        month = 'Okt';
        break;
      case 11:
        month = 'Nov';
        break;
      default:
        month = 'Des';
        break;
    }

    return month + ' ${time.day}, ${time.hour}:${time.minute}';
  }
}
