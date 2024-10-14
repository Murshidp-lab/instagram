part of 'highlight_bloc.dart';

@immutable
sealed class HighlightState {}

final class HighlightInitial extends HighlightState {}
class hihglightloading extends HighlightState{}
class hihglightloaded extends HighlightState{}
class hihglighterror extends HighlightState{}