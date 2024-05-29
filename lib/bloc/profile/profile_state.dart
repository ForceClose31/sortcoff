
import 'package:equatable/equatable.dart';
import '../../models/user_data.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final UserProfile userProfile;
  final String email;

  const ProfileLoaded(this.userProfile, this.email);

  @override
  List<Object> get props => [userProfile, email];
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);

  @override
  List<Object> get props => [message];
}
