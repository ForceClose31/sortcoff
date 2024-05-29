
import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class LoadUserProfile extends ProfileEvent {}

class UpdateUserProfile extends ProfileEvent {
  final String name;
  final String phoneNumber;

  const UpdateUserProfile(this.name, this.phoneNumber);

  @override
  List<Object> get props => [name, phoneNumber];
}

class LogOutUser extends ProfileEvent {}
