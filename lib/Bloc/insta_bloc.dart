import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../repository/api/insta/insta.dart';
import '../repository/model class/insta model.dart';

part 'insta_event.dart';

part 'insta_state.dart';

class InstaBloc extends Bloc<InstaEvent, InstaState> {
  late InstaModel instamodel;
  InstaApi instaApi = InstaApi();

  InstaBloc() : super(InstaInitial()) {
    on<Fetchinsta>((event, emit)async {
      emit(instaloading());
      try {
        instamodel = await instaApi.getInsta(event.name);
        emit(instaloaded());
      }
      catch(e){
        emit(instaerror());

      }
      // TODO: implement event handler
    });
  }
}
