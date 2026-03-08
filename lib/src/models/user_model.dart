import 'package:agricola_core/src/enums/merchant_type.dart';
import 'package:agricola_core/src/enums/user_type.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String uid;
  final String email;
  final String? phoneNumber;
  final bool emailVerified;
  final DateTime createdAt;
  final DateTime? lastSignInAt;

  // Agricola-specific fields
  final UserType userType;
  final MerchantType? merchantType;
  final bool isProfileComplete;
  final bool hasSkippedProfileSetup;
  final bool isAnonymous;

  const UserModel({
    required this.uid,
    required this.email,
    this.phoneNumber,
    required this.emailVerified,
    required this.createdAt,
    this.lastSignInAt,
    required this.userType,
    this.merchantType,
    this.isProfileComplete = false,
    this.hasSkippedProfileSetup = false,
    this.isAnonymous = false,
  });

  @override
  List<Object?> get props => [
    uid,
    email,
    phoneNumber,
    emailVerified,
    createdAt,
    lastSignInAt,
    userType,
    merchantType,
    isProfileComplete,
    hasSkippedProfileSetup,
    isAnonymous,
  ];

  UserModel copyWith({
    String? uid,
    String? email,
    String? phoneNumber,
    bool? emailVerified,
    DateTime? createdAt,
    DateTime? lastSignInAt,
    UserType? userType,
    MerchantType? merchantType,
    bool? isProfileComplete,
    bool? hasSkippedProfileSetup,
    bool? isAnonymous,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      emailVerified: emailVerified ?? this.emailVerified,
      createdAt: createdAt ?? this.createdAt,
      lastSignInAt: lastSignInAt ?? this.lastSignInAt,
      userType: userType ?? this.userType,
      merchantType: merchantType ?? this.merchantType,
      isProfileComplete: isProfileComplete ?? this.isProfileComplete,
      hasSkippedProfileSetup: hasSkippedProfileSetup ?? this.hasSkippedProfileSetup,
      isAnonymous: isAnonymous ?? this.isAnonymous,
    );
  }
}
