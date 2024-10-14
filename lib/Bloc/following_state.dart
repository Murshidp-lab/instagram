part of 'following_bloc.dart';

@immutable
sealed class FollowingState {}

final class FollowingInitial extends FollowingState {}
class followingloading extends FollowingState{}
class followingloaded extends FollowingState{}
class followingerror extends FollowingState{}