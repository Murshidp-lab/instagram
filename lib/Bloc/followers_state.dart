part of 'followers_bloc.dart';

@immutable
sealed class FollowersState {}

final class FollowersInitial extends FollowersState {}
class followersloading extends FollowersState{}
class followersloaded extends FollowersState{}
class followerserror extends FollowersState{}