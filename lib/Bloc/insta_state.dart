part of 'insta_bloc.dart';

@immutable
sealed class InstaState {}

final class InstaInitial extends InstaState {}
class instaloading extends InstaState{}
class instaloaded extends InstaState{}
class instaerror extends InstaState{}