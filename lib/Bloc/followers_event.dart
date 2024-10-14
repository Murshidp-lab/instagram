part of 'followers_bloc.dart';

@immutable
sealed class FollowersEvent {}
class fetchfollowers extends FollowersEvent{late final String name;
  fetchfollowers ({required this.name});
}