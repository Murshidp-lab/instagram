part of 'tag_bloc.dart';

@immutable
sealed class TagEvent {}
class fetchtag extends TagEvent{late final String name;
fetchtag ({required this.name});}
