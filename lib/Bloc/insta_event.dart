part of 'insta_bloc.dart';

@immutable
sealed class InstaEvent {}
class Fetchinsta extends InstaEvent{
  late final String name;
  Fetchinsta({required this.name});
}
