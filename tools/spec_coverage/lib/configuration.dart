class Configuration {
  final String co19Dir;
  final String specPath;

  Configuration.fromJson(Map<String, dynamic> json)
      : co19Dir = json["co19Dir"],
        specPath = json["specPath"];
}
