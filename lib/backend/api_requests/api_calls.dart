import 'dart:convert';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class QuestionAPICall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'Question API',
      apiUrl:
          'https://script.googleusercontent.com/macros/echo?user_content_key=hqhoKLP3czKjMb-mrDJEDy6mWT-y6F-K5Rs_ciN8-5Yf4UniNGOA8PFIreLFFjIKD3Z2W4Bw2155kDeHyftRoHjl9DSsC8bvm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnAfO_aaeYXLwbVGHhF-mFnKAlTtX7vWIcGJXlXGwN3-c5jggA--LG7Ktt48FFGQlPqKvmisG5F_X5nqKqzh2lz_9qegXN9EexNz9Jw9Md8uu&lib=M1QLgp26nb9zKG91yS0AT-GHp-gJkS33p',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
