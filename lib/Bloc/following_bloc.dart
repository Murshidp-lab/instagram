import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../repository/api/insta/insta.dart';
import '../repository/model class/following model.dart';

part 'following_event.dart';
part 'following_state.dart';

class FollowingBloc extends Bloc<FollowingEvent, FollowingState> {
  late Following following;
  InstaApi instaApi = InstaApi();
  FollowingBloc() : super(FollowingInitial()) {
    on<fetchfollowing>((event, emit)async {
      emit (followingloading());
      try {
        following = await instaApi.getfollowing(event.name);
        emit(followingloaded());
      }
      catch (e) {
        emit(followingerror());
      }
      // TODO: implement event handler
    });
  }
}
