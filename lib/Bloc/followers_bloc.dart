import 'package:bloc/bloc.dart';
import 'package:instagram/repository/model%20class/followers%20model.dart';
import 'package:meta/meta.dart';

import '../repository/api/insta/insta.dart';

part 'followers_event.dart';
part 'followers_state.dart';

class FollowersBloc extends Bloc<FollowersEvent, FollowersState> {
  late Followers followers;
  InstaApi instaApi = InstaApi();
  FollowersBloc() : super(FollowersInitial()) {
    on<fetchfollowers>((event, emit)async {
      emit (followersloading());
      try {
        followers = await instaApi.getfollowers(event.name);
        emit(followersloaded());
      }
      catch (e) {
        emit(followerserror());
      }
      // TODO: implement event handler
    });
  }
}
