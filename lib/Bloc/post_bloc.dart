import 'package:bloc/bloc.dart';
import 'package:instagram/repository/model%20class/post%20model.dart';
import 'package:meta/meta.dart';

import '../repository/api/insta/insta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  late Post post;
  InstaApi instaApi = InstaApi();
  PostBloc() : super(PostInitial()) {
    on<Fetchpost>((event, emit)async {
      emit(postloading());
      try {
        post = await instaApi.getpost(event.name);
        emit(postloaded());
      }
      catch (e) {
        emit(posterror());
      }
      // TODO: implement event handler
    });
  }
}
