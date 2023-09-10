const String HOST = "http://127.0.0.1:8000";
const String WS_HOST = "ws://127.0.0.1:8000";
const String API_PREFIX = HOST + "/api";
const String WS_PREFIX = WS_HOST + "/ws";

String urlBuilder({int version = 1, required List<String> paths}) {
  return API_PREFIX + "/v$version/" + paths.join('/');
}

String wsUrlBuilder({int version = 1, required List<String> paths}) {
  return WS_PREFIX + '/' + paths.join('/');
}
