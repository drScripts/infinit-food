import 'dart:convert';
import 'dart:io';

import 'package:infinit_food/models/models.dart';
import 'package:http/http.dart' as http;

part 'user_services.dart';
part 'food_services.dart';
part 'transaction_services.dart';

const String baseUrl = 'https://foodmarket-backend.buildwithangga.id/api/';
