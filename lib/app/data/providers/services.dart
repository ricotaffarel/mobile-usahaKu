import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:usahaku/app/data/models/address.dart';
import 'package:usahaku/app/data/models/roles.dart';
import 'package:usahaku/app/data/models/user.dart';
import 'package:usahaku/app/data/providers/sesionManajer.dart';
import 'package:usahaku/app/routes/app_pages.dart';
import 'package:usahaku/app/utils/api_return_value.dart';
import 'dart:async';

part 'user_provider.dart';
part 'roles_provider.dart';
part 'address_provider.dart';

String baseURL = "http://192.168.149.100:8080";
String base = "http://192.168.149.100:8080/";

//AUTH USER
String urllogin = "$baseURL/api/auth/login";
String urlregister = "$baseURL/api/auth/register";
String urlgetUser = "$baseURL/api/auth/me";
String urlupdateUser = "$baseURL/api/auth/update-user";
String urluploadPPUser = "$baseURL/api/auth/upload-photo";

//Roles
String urlgetRoles = "$baseURL/api/get-roles";

//ADMIN Data USER
String urlAdminCreateUser = "$baseURL/api/auth/add-user";
String urlAdminGetUser = "$baseURL/api/auth/get-user";
String urlAdminUpdateUser = "$baseURL/api/auth/admin-update-user";
String urlAdminUpdateStatusUser = "$baseURL/api/auth/admin-update-status-user";
String urlAdminUpdatePwUser = "$baseURL/api/auth/admin-update-password-user";

//Address
String urlGetProvince = "$baseURL/api/get-province";
String urlGetDistrict = "$baseURL/api/get-district";
String urlGetCity = "$baseURL/api/get-city";
String urlGetVillage = "$baseURL/api/get-village";
String urlGetAddress = "$baseURL/api/get-address";
String urlAddAddressUser = "$baseURL/api/address";

