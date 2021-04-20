part of 'services.dart';

class UserServices {
  static Future<ApiReturnValue<User>> signIn(String email, String password) async {
    // await Future.delayed(Duration(milliseconds: 500));
    // return ApiReturnValue(value: mockUser);

    http.Client client = http.Client();
    String url = baseUrl + 'login';

    var response = await client.post(Uri.parse(url), body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(massage: "Failed Login");
    }

    // print(response.body);
    // decode bodynya
    var data = jsonDecode(response.body);
    // ambil tokennya
    User.token = data['data']['access_token'];
    // print(User.token);
    // masukan ke factory
    User value = User.fromJson(data['data']['user']);
    // return value
    return ApiReturnValue(value: value);
    // return ApiReturnValue(massage: 'Wrong Email or Password');
  }

  static Future<ApiReturnValue<User>> signUp(User user, String password, {File pictureFile, http.Client client}) async {
    if (client == null) {
      client = http.Client();
    }

    String url = baseUrl + 'register';

    var response = await client.post(Uri.parse(url), headers: {
      "Accept": "application/json"
    }, body: {
      'name': user.name,
      'email': user.email,
      'password': password,
      'password_confirmation': password,
      'address': user.address,
      'city': user.city,
      'houseNumber': user.houseNumber,
      'phoneNumber': user.phoneNumber,
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(massage: 'Please try again later');
    }

    var data = jsonDecode(response.body);
    User.token = data['data']['access_token'];
    User value = User.fromJson(data['data']['user']);

    if (pictureFile != null) {
      ApiReturnValue<String> result = await uploadProfilePicture(pictureFile) as ApiReturnValue<String>;
      if (result.value != null) {
        value = value.copyWith(
          picturePath: 'http://foodmarket-backend.buildwithangga.id/storage/' + result.value,
        );
      }
    }

    return ApiReturnValue(value: value);
  }

  static Future<dynamic> uploadProfilePicture(File file, [http.MultipartRequest request]) async {
    String url = baseUrl + 'user/photo';
    var uri = Uri.parse(url);

    if (request == null) {
      request = http.MultipartRequest('POST', uri)
        ..headers['Content-Type'] = "application/json"
        ..headers['Authorization'] = "Bearer ${User.token}";
    }

    var multiPartFile = await http.MultipartFile.fromPath('file', file.path);
    request.files.add(multiPartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var data = jsonDecode(responseBody);

      String imagePath = data['data'][0];
      return (ApiReturnValue(value: imagePath));
    } else {
      return ApiReturnValue(massage: "Gagal Upload Image");
    }
  }
}
