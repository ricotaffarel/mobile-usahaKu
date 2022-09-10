part of 'services.dart';

class AddressProvider extends GetConnect {
  Future<ApiReturnValue> getProvinces() async {
    String url = urlGetProvince;

    Response res = await get(url);

    if (res.statusCode != 200) {
      debugPrint(res.body.toString());
      return ApiReturnValue(message: res.body.toString());
    }
    var data = res.body;
    List<Province> result = (data['data']['province'] as Iterable)
        .map((e) => Province.fromJson(e))
        .toList();
    return ApiReturnValue(value: result);
  }

  Future<ApiReturnValue> getCity(String code) async {
    String url = '$urlGetCity?province_code=$code';

    Response res = await get(url);

    if (res.statusCode != 200) {
      debugPrint(res.body.toString());
      return ApiReturnValue(message: res.body.toString());
    }

    var data = res.body;
    List<City> result = (data['data']['city'] as Iterable)
        .map((e) => City.fromJson(e))
        .toList();
    return ApiReturnValue(value: result);
  }

  Future<ApiReturnValue> getDistrict(String code) async {
    String url = '$urlGetDistrict?city_code=$code';

    Response res = await get(url);

    if (res.statusCode != 200) {
      debugPrint(res.body.toString());
      return ApiReturnValue(message: res.body.toString());
    }

    var data = res.body;

    List<District> result = (data['data']['district'] as Iterable)
        .map((e) => District.fromJson(e))
        .toList();
    return ApiReturnValue(value: result);
  }

  Future<ApiReturnValue> getVillage(String code) async {
    String url = '$urlGetVillage?district_code=$code';

    Response res = await get(url);

    if (res.statusCode != 200) {
      debugPrint(res.body.toString());
      return ApiReturnValue(message: res.body.toString());
    }

    var data = res.body;

    List<Village> result = (data['data']['village'] as Iterable)
        .map((e) => Village.fromJson(e))
        .toList();
    return ApiReturnValue(value: result);
  }

  Future<ApiReturnValue> getAddress() async {
    String url = urlGetAddress;

    Response res = await get(url);

    if (res.statusCode != 200) {
      debugPrint(res.body.toString());
      return ApiReturnValue(message: res.body.toString());
    }

    var data = res.body;
    List<Address> result = (data['data']['address'] as Iterable)
        .map((e) => Address.fromJson(e))
        .toList();
    return ApiReturnValue(value: result);
  }

  Future<ApiReturnValue> createAddressUser(
      Int userId,
      String name,
      String title,
      String detailAddress,
      Int provinceCode,
      Int cityCode,
      Int districtCode,
      Int villageCode,
      String lat,
      String long) async {
    String url = urlAddAddressUser;
    var formData = FormData({
      'user_id': userId,
      'name': name,
      'title': title,
      'detail_address': detailAddress,
      'province_code': provinceCode,
      'city_code': cityCode,
      'district_code': districtCode,
      'village_code': villageCode,
      'latitude': lat,
      'longitude': long,
    });
    Response res = await post(url, formData);

    if (res.statusCode != 200) {
      debugPrint(res.body.toString());
      return ApiReturnValue(message: res.body.toString());
    }

    var data = res.body;
    Address result = data['data']['address'];
    debugPrint(result.name);
    return ApiReturnValue(value: result);
  }
}
