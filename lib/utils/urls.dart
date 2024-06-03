class URLs {
  static const String serverUrl = "https://api.nekosapi.com/v3";

  static String complete(String local) {
    return serverUrl + local;
  }
}
