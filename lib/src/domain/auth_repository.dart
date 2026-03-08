import 'package:agricola_core/src/domain/auth_failure.dart';
import 'package:agricola_core/src/enums/merchant_type.dart';
import 'package:agricola_core/src/enums/user_type.dart';
import 'package:agricola_core/src/models/user_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Stream<UserModel?> get authStateChanges;

  UserModel? get currentUser;

  Future<Either<AuthFailure, void>> deleteAccount();

  Future<Either<AuthFailure, UserModel>> refreshUserData();

  Future<Either<AuthFailure, void>> sendPasswordResetEmail(String email);

  Future<Either<AuthFailure, String>> signInAnonymously();

  Future<Either<AuthFailure, UserModel>> signInWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<AuthFailure, UserModel>> signInWithGoogle({
    required UserType userType,
    MerchantType? merchantType,
  });

  Future<Either<AuthFailure, void>> signOut();

  Future<Either<AuthFailure, UserModel>> signUpWithEmailPassword({
    required String email,
    required String password,
    required UserType userType,
    MerchantType? merchantType,
  });

  Future<Either<AuthFailure, void>> updateProfileCompletionStatus(
    bool isComplete,
  );

  Future<Either<AuthFailure, void>> markProfileSetupAsSkipped();
}
