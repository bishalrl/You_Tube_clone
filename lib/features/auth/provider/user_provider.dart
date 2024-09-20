import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube_clone/features/auth/model/user_model.dart';
import 'package:you_tube_clone/features/auth/repository/user_data_Service.dart';

final currentUserProvider = FutureProvider<UserModel>((ref) async{
  final UserModel user=await ref.watch(userDataServiceProvider).fetchCurrentUserData();
  return user;
});