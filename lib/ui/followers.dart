import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram/Bloc/following_bloc.dart';
import 'package:instagram/repository/model%20class/followers%20model.dart';
import 'package:instagram/repository/model%20class/following%20model.dart';
import 'package:instagram/ui/followingpage.dart';

import '../Bloc/followers_bloc.dart';

class Followers1 extends StatefulWidget {
  final String followers;
  final String follownig;
  final String username;
  final String username1;

  const Followers1(
      {super.key, required this.followers, required this.follownig, required this.username, required this.username1});

  @override
  State<Followers1> createState() => _Followers1State();
}

class _Followers1State extends State<Followers1> {
  late Followers followers;
  late Following following;

  @override
  void initState() {
    BlocProvider.of<FollowersBloc>(context).add(
        fetchfollowers(name: widget.username1));
    BlocProvider.of<FollowingBloc>(context).add(
        fetchfollowing(name: widget.username1));

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: (Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 30.sp,
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: 80.w,
                    ),
                    Text(
                      widget.username,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              TabBar(tabs: [
                Tab(
                  icon: Text(
                    "${widget.followers}Followers",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Tab(
                  icon: Text(
                    "${widget.follownig}Following",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ]),
              Expanded(
                  child: TabBarView(children: [
                    SizedBox(
                      height: 130.h,
                      child: BlocBuilder<FollowersBloc, FollowersState>(
                        builder: (context, state) {
                          if (state is followersloading) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (state is followerserror) {
                            return RefreshIndicator(
                                child: Text("no internet connection"),
                                onRefresh: () async {
                                  return BlocProvider.of<FollowersBloc>(context)
                                      .add(fetchfollowers(name: ''));
                                });
                          }
                          if (state is followersloaded) {
                            followers =
                                BlocProvider
                                    .of<FollowersBloc>(context)
                                    .followers;
                            return ListView.separated(
                              itemCount: followers.data!.items!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Followingpage(name:followers
                                    .data!.items![index].username
                                    .toString()),));},
                                  child: ListTile(
                                      leading: CircleAvatar(
                                        radius: 30.r,
                                        backgroundImage: NetworkImage(followers
                                            .data!.items![index].profilePicUrl
                                            .toString()),
                                      ),
                                      title: Text(followers
                                          .data!.items![index].username
                                          .toString()),
                                      textColor: Colors.white,
                                      subtitle: Text(followers
                                          .data!.items![index].fullName
                                          .toString()),
                                      trailing: Container(
                                        width: 85.w,
                                        height: 25.h,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFF4192EF),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                5.73),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'remove',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.sp,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      )),
                                );
                              },
                              separatorBuilder: (BuildContext context,
                                  int index) {
                                return SizedBox(
                                  height: 10.h,
                                );
                              },
                            );
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 100.h,
                      child: BlocBuilder<FollowingBloc, FollowingState>(
                        builder: (context, state) {
                          if (state is followingloading) {
                            return Center(child: CircularProgressIndicator());
                          }
                          if (state is followingerror) {
                            return RefreshIndicator(
                                child: Text(
                                  'no internet connection',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                onRefresh: () async {
                                  return BlocProvider.of<FollowersBloc>(context)
                                      .add(
                                      fetchfollowers(name: widget.username1));
                                });
                          }
                          if (state is followingloaded) {
                            following = BlocProvider
                                .of<FollowingBloc>(context)
                                .following;
                            return ListView.separated(
                              itemCount: following.data!.items!.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) =>
                                          Followingpage(name:  following.data!.items![index].username
                                              .toString()),));
                                },
                                  child: ListTile(
                                      leading: CircleAvatar(
                                        radius: 30.r,
                                        backgroundImage: NetworkImage(following
                                            .data!.items![index].profilePicUrl
                                            .toString()),
                                      ),
                                      title: Text(
                                          following.data!.items![index].username
                                              .toString()),
                                      textColor: Colors.white,
                                      subtitle: Text(
                                          following.data!.items![index].fullName
                                              .toString()),
                                      trailing: Container(
                                        width: 85.w,
                                        height: 25.h,
                                        decoration: ShapeDecoration(
                                          color: Color(0xFF4192EF),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                5.73),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'following',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.sp,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      )),
                                );
                              },
                              separatorBuilder: (BuildContext context,
                                  int index) {
                                return SizedBox(
                                  height: 10.h,
                                );
                              },
                            );
                          }
                          else {
                            return SizedBox();
                          }
                        },
                      ),
                    )
                  ]))
            ],
          )),
        ),
      ),
    );
  }
}
