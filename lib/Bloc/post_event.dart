part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}
class Fetchpost extends PostEvent{late final String name;
Fetchpost({required this.name});}
