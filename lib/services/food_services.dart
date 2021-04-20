part of 'services.dart';

class FoodServices {
  static Future<ApiReturnValue<List<Food>>> getFood() async {
    // await Future.delayed(Duration(milliseconds: 500));

    http.Client client = http.Client();
    Uri url = Uri.parse(baseUrl + 'food');
    var response = await client.get(url);
    // print(response.body);
    if (response.statusCode != 200) {
      return ApiReturnValue(massage: "Please Try Again Later");
    }
    var val = jsonDecode(response.body);
    // print(val['data']['data']);
    List<Food> data = (val['data']['data'] as Iterable).map((e) => Food.fromJson(e)).toList();
    return ApiReturnValue(value: data);
  }
}
