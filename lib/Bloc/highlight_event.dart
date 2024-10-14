part of 'highlight_bloc.dart';

@immutable
sealed class HighlightEvent {}
class fetchhihglight extends HighlightEvent{late final String name;
fetchhihglight ({required this.name});}