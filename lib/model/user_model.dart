import 'dart:convert';

import 'package:presence_alpha/model/user_annual_leave.dart';

class UserModel {
  String? id;
  String? userCode;
  String? username;
  String? password;
  String? email;
  String? phoneNumber;
  String? accountType;
  String? name;
  String? address;
  String? description;
  String? startedWorkAt;
  String? profilePicture;
  bool? deviceTracker;
  String? createdBy;
  bool? deleted;
  bool? canWfh;
  String? updatedAt;
  String? createdAt;
  String? token;
  String? deviceUnique;
  String? deviceUid;
  String? otp;
  String? updatedBy;
  String? deletedBy;
  String? deletedAt;
  final UserAnnualLeaveModel? userAnnualLeave;

  UserModel(
      {this.id,
      this.userCode,
      this.username,
      this.password,
      this.email,
      this.phoneNumber,
      this.accountType,
      this.name,
      this.address,
      this.description,
      this.startedWorkAt,
      this.profilePicture,
      this.deviceTracker,
      this.createdBy,
      this.deleted,
      this.canWfh,
      this.updatedAt,
      this.createdAt,
      this.token,
      this.deviceUnique,
      this.deviceUid,
      this.otp,
      this.updatedBy,
      this.deletedBy,
      this.deletedAt,
      this.userAnnualLeave});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      userCode: json['user_code'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
      phoneNumber: json['phone_number'],
      accountType: json['account_type'],
      name: json['name'],
      address: json['address'],
      description: json['description'],
      startedWorkAt: json['started_work_at'],
      profilePicture: json['profile_picture'],
      deviceTracker: json['device_tracker'],
      createdBy: json['created_by'],
      deleted: json['deleted'],
      canWfh: json['can_wfh'],
      updatedAt: json['updatedAt'],
      createdAt: json['createdAt'],
      token: json['token'],
      deviceUnique: json['device_unique'],
      deviceUid: json['device_uid'],
      otp: json['otp'],
      updatedBy: json['updated_by'],
      deletedBy: json['deleted_by'],
      deletedAt: json['deletedAt'],
      userAnnualLeave: json['user_annual_leave'] != null
          ? UserAnnualLeaveModel.fromJson(json['user_annual_leave'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_code'] = userCode;
    data['username'] = username;
    data['password'] = password;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['account_type'] = accountType;
    data['name'] = name;
    data['address'] = address;
    data['description'] = description;
    data['started_work_at'] = startedWorkAt;
    data['profile_picture'] = profilePicture;
    data['device_tracker'] = deviceTracker;
    data['created_by'] = createdBy;
    data['deleted'] = deleted;
    data['can_wfh'] = canWfh;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['token'] = token;
    data['device_unique'] = deviceUnique;
    data['device_uid'] = deviceUid;
    data['otp'] = otp;
    data['updated_by'] = updatedBy;
    data['deleted_by'] = deletedBy;
    data['deleted_at'] = deletedAt;
    data['created_by'] = createdBy;
    data['deleted'] = deleted;
    data['can_wfh'] = canWfh;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['token'] = token;
    data['device_unique'] = deviceUnique;
    data['device_uid'] = deviceUid;
    data['otp'] = otp;
    data['updated_by'] = updatedBy;
    data['deleted_by'] = deletedBy;
    data['deleted_at'] = deletedAt;
    data['user_annual_leave'] =
        userAnnualLeave != null ? userAnnualLeave!.toJson() : null;
    return data;
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }
}
