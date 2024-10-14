import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../repository/api/insta/insta.dart';
import '../repository/model class/tag model.dart';

part 'tag_event.dart';

part 'tag_state.dart';

class TagBloc extends Bloc<TagEvent, TagState> {
  late Tag tagmodel;
  InstaApi instaApi = InstaApi();

  TagBloc() : super(TagInitial()) {
    on<fetchtag>((event, emit) async {
      emit(tagloading());
      try {
        tagmodel
        = await instaApi.getTag(event.name);
        emit(tagloaded());
      } catch (e) {
        emit(tagerror());
      }
      // TODO: implement event handler
    });
  }
}
