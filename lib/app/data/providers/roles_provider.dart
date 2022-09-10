part of 'services.dart';

class RolesProvider extends GetConnect {
  Future<ApiReturnValue> getRoles() async {
    String url = urlgetRoles;

    Response res = await get(url);

    if (res.statusCode != 200) {
      debugPrint(res.body.toString());
      return ApiReturnValue(message: res.body.toString());
    }

    var data = res.body;
    List<Roles> result = (data['data']['roles'] as Iterable)
        .map((e) => Roles.fromJson(e))
        .toList();
    return ApiReturnValue(value: result);
  }
}
