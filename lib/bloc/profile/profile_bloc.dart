
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/user_data.dart';
import '../../services/user_services.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final UserService _userService;

  ProfileBloc(this._userService) : super(ProfileInitial()) {
    on<LoadUserProfile>(_onLoadUserProfile);
    on<UpdateUserProfile>(_onUpdateUserProfile);
    on<LogOutUser>(_onLogOutUser);
  }

  Future<void> _onLoadUserProfile(
    LoadUserProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final userProfile = await _userService.getUserProfile();
      final user = await _userService.getCurrentUser();
      if (userProfile != null && user != null) {
        emit(ProfileLoaded(userProfile, user.email ?? ''));
      } else {
        emit(const ProfileError('Failed to load user profile'));
      }
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> _onUpdateUserProfile(
    UpdateUserProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final user = await _userService.getCurrentUser();
      if (user != null) {
        final updatedProfile = UserProfile(
          uid: user.uid,
          name: event.name,
          phoneNumber: event.phoneNumber,
        );
        await _userService.updateUserProfile(updatedProfile);
        emit(ProfileLoaded(updatedProfile, user.email ?? ''));
      } else {
        emit(const ProfileError('Failed to update user profile'));
      }
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> _onLogOutUser(
    LogOutUser event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      await _userService.signOut();
      emit(ProfileInitial());
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
