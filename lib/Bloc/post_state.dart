part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}
class postloading extends PostState{}
class postloaded extends PostState{}
class posterror extends PostState{}