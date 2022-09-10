part of 'services.dart';

class UserProvider extends GetConnect {
  static String? token;

  Future<ApiReturnValue> login(String email, String password) async {
    String url = urllogin;
    //var uri = Uri.parse(url);

    var formData = FormData({
      'email': email,
      'password': password,
    });
    var res = await post(url, formData);

    if (res.statusCode != 200) {
      debugPrint(res.body.toString());
      return ApiReturnValue(message: res.body.toString());
    }

    var dataUser = (res.body);
    User.token = dataUser['data']['token'];
    User result = User.fromJson(dataUser['data']);
    token = User.token.toString();
    await session.saveSessions(token);
    await session.getSessions();
    //debugPrint(session.token);
    return ApiReturnValue(value: result);
  }

  Future<ApiReturnValue> register(
      String name, String email, String password, String birthday) async {
    String url = urlregister;
    //var uri = Uri.parse(url);
    var formData = FormData({
      'name': name,
      'email': email,
      'password': password,
      'roles_id': 4,
      'birthday': birthday
    });
    var res = await post(url, formData);

    if (res.statusCode != 200) {
      debugPrint(res.body.toString());
      return ApiReturnValue(message: res.body.toString());
    }

    var dataUser = (res.body);
    User result = User.fromJson(dataUser['data']['user']);
    return ApiReturnValue(value: result);
  }

  Future<ApiReturnValue> getMe() async {
    String url = urlgetUser;
    await session.getSessions();
    var formData = FormData({
      'token': session.token,
    });
    var res = await post(url, formData);

    if (res.statusCode != 200) {
      debugPrint(res.body.toString());
      Get.offAllNamed(Routes.ON_BOARDING);
      return ApiReturnValue(message: res.body.toString());
    }

    var dataUser = (res.body);
    User data = User.fromJson(dataUser['data']['user']);
    //debugPrint(user.value!.name);
    if (data.rolesId == 1) {
      debugPrint("admin");
      Get.offAllNamed(Routes.ADMIN_PROFILE);
    } else if (data.rolesId == 2) {
      debugPrint("Ini s");
    } else if (data.rolesId == 3) {
      debugPrint("Ini d");
    } else if (data.rolesId == 4) {
      debugPrint("Ini c");
    } else {
      Get.offAllNamed(Routes.ON_BOARDING);
    }
    return ApiReturnValue(value: data);
  }

  Future<ApiReturnValue> updateUser(String name, String email, String password,
      String birthday, String jenisKelamin) async {
    String url = urlupdateUser;
    //var uri = Uri.parse(url);
    await session.getSessions();
    var formData = FormData({
      'token': session.token,
      'name': name,
      'email': email,
      'password': password,
      'birthday': birthday,
      'jenis_kelamin': jenisKelamin
    });
    var res = await post(url, formData);

    if (res.statusCode != 200) {
      debugPrint(res.body.toString());
      return ApiReturnValue(message: res.body.toString());
    }
    var dataUser = (res.body);
    User data = User.fromJson(dataUser['data']);
    debugPrint(session.token);
    debugPrint(data.jenisKelamin);
    return ApiReturnValue(value: data);
  }

  Future<ApiReturnValue> updatePPUser(File photo) async {
    String url = urluploadPPUser;
    //var uri = Uri.parse(url);
    await session.getSessions();
    var formData = FormData({'token': session.token, 'file': photo});
    var res = await post(url, formData);

    if (res.statusCode != 200) {
      debugPrint(res.body.toString());
      return ApiReturnValue(message: res.body.toString());
    }
    var dataUser = (res.body);
    User data = User.fromJson(dataUser['data']);
    debugPrint(session.token);
    return ApiReturnValue(value: data);
  }

  //admin
  Future<ApiReturnValue> createUser(String name, String email, String password,
      int rolesId, String birthday) async {
    String url = urlAdminCreateUser;

    var formData = FormData({
      'name': name,
      'email': email,
      'password': password,
      'roles_id': rolesId,
      'birthday': birthday
    });
    var res = await post(url, formData);

    if (res.statusCode != 200) {
      debugPrint(res.body.toString());
      return ApiReturnValue(message: res.body.toString());
    }

    var dataUser = (res.body);
    User result = User.fromJson(dataUser['data']['user']);
    return ApiReturnValue(value: result);
  }

  Future<ApiReturnValue> getUser() async {
    String url = urlAdminGetUser;
    await session.getSessions();

    var formData = FormData({
      'token': session.token,
    });

    Response res = await post(url, formData);

    if (res.statusCode != 200) {
      debugPrint(res.body.toString());
      return ApiReturnValue(message: res.body.toString());
    }

    var data = res.body;
    List<User> result = (data['data']['user'] as Iterable)
        .map((e) => User.fromJson(e))
        .toList();
    return ApiReturnValue(value: result);
  }

  Future<ApiReturnValue> updateDataUser(String name, String email, int rolesId,
      String birthday, String jenisKelamin, String status) async {
    String url = urlAdminUpdateUser;

    await session.getSessions();
    var formData = FormData({
      'token': session.token,
      'name': name,
      'email': email,
      'roles_id': rolesId,
      'birthday': birthday,
      'jenis_kelamin': jenisKelamin,
      'status_pengguna': status
    });
    Response res = await post(url, formData);

    if (res.statusCode != 200) {
      debugPrint(res.body.toString());
      return ApiReturnValue(message: res.body.toString());
    }

    var dataUser = (res.body);
    User data = User.fromJson(dataUser['data']['user'][0]);
    debugPrint(session.token);
    debugPrint("jajskajs : ${data.jenisKelamin}");
    return ApiReturnValue(value: data);
  }

  Future<ApiReturnValue> updateDataPwUser(String email, String password) async {
    String url = urlAdminUpdatePwUser;

    await session.getSessions();
    var formData = FormData({
      'token': session.token,
      'email': email,
      'password': password,
    });
    Response res = await post(url, formData);

    if (res.statusCode != 200) {
      debugPrint(res.body.toString());
      return ApiReturnValue(message: res.body.toString());
    }

    var dataUser = (res.body);
    User data = User.fromJson(dataUser['data']['user'][0]);
    debugPrint(session.token);
    debugPrint("jajskajs : ${data.jenisKelamin}");
    return ApiReturnValue(value: data);
  }
}
