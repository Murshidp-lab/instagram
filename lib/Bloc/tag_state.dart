part of 'tag_bloc.dart';

@immutable
sealed class TagState {}

final class TagInitial extends TagState {}
class tagloading extends TagState{}
class tagloaded extends TagState{}
class tagerror extends TagState{}