class UserRequest {
  final int? page;
  UserRequest(this.page);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['page'] = page;
    json.removeWhere((key, value) => value == null);
    return json;
  }
}
