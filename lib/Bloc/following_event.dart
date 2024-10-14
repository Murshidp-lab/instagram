part of 'following_bloc.dart';

@immutable
sealed class FollowingEvent {}
class fetchfollowing extends FollowingEvent{late final String name;
fetchfollowing ({required this.name});}