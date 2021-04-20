part of 'services.dart';

class TransactionServices {
  static Future<ApiReturnValue<List<Transaction>>> getTransactions() async {
    // await Future.delayed(Duration(seconds: 3));
    Uri url = Uri.parse(baseUrl + 'transaction');
    http.Client client = http.Client();

    var response = await client.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + User.token,
    });

    if (response.statusCode != 200) {
      ApiReturnValue(massage: 'Please Try Again Later');
    }

    var data = jsonDecode(response.body);
    List<Transaction> dataFix = (data['data']['data'] as Iterable).map((e) => Transaction.fromJson(e)).toList();

    return ApiReturnValue(value: dataFix);
  }

  static Future<ApiReturnValue<Transaction>> getSingleTransaction(Transaction transaction) async {
    http.Client client = http.Client();

    Uri url = Uri.parse(baseUrl + 'checkout');
    var response = await client.post(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ' + User.token,
      },
      body: {
        'food_id': transaction.food.id.toString(),
        'user_id': transaction.user.id.toString(),
        'quantity': transaction.quantity.toString(),
        'total': transaction.total.toString(),
        'status': "PENDING",
      },
    );
    if (response.statusCode != 200) {
      return ApiReturnValue(massage: "Please Try Again");
    }

    var json = jsonDecode(response.body);
    print(json);
    Transaction value = Transaction.fromJson(json['data']);
    return ApiReturnValue(value: value);

    // await Future.delayed(Duration(seconds: 2));
    // return ApiReturnValue(
    //     value: transaction.copyWith(
    //   id: 123,
    //   status: TransactionStatus.pending,
    // ));

    // return ApiReturnValue(massage: "Transaction Failed");
  }
}
