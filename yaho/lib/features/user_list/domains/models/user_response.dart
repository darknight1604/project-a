import 'package:equatable/equatable.dart';

class UserResponse {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<User>? data;
  // Support? support;

  UserResponse({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    // this.support,
  });

  UserResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <User>[];
      json['data'].forEach((v) {
        data!.add(User.fromJson(v));
      });
    }
    // support =
    //     json['support'] != null ? new Support.fromJson(json['support']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['per_page'] = perPage;
    data['total'] = total;
    data['total_pages'] = totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    // if (support != null) {
    //   data['support'] = support!.toJson();
    // }
    return data;
  }
}

class User extends Equatable {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  const User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        email: json['email'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        avatar: json['avatar'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    return data;
  }

  @override
  String toString() => 'id: $id, email: $email';

  @override
  List<Object?> get props => [
        id,
        email,
      ];
}

// class Support {
//   String? url;
//   String? text;

//   Support({this.url, this.text});

//   Support.fromJson(Map<String, dynamic> json) {
//     url = json['url'];
//     text = json['text'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['url'] = this.url;
//     data['text'] = this.text;
//     return data;
//   }
// }
