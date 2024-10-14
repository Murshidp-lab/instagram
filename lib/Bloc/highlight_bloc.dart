import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../repository/api/insta/insta.dart';
import '../repository/model class/highlight model.dart';


part 'highlight_event.dart';

part 'highlight_state.dart';

class HighlightBloc extends Bloc<HighlightEvent, HighlightState> {
  late Highlight highlight;
  InstaApi instaApi = InstaApi();

  HighlightBloc() : super(HighlightInitial()) {
    on<fetchhihglight>((event, emit) async {
      emit(hihglightloading());
      try {
        highlight = await instaApi.gethighlight(event.name);
        emit(hihglightloaded());
      }
      catch (e) {
        emit(hihglighterror());
      }
    });
  }
}