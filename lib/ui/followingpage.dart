import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram/Bloc/followers_bloc.dart';
import 'package:instagram/Bloc/highlight_bloc.dart';
import 'package:instagram/Bloc/insta_bloc.dart';
import 'package:instagram/Bloc/post_bloc.dart';
import 'package:instagram/Bloc/tag_bloc.dart';
import 'package:instagram/repository/model%20class/followers%20model.dart';
import 'package:instagram/repository/model%20class/highlight%20model.dart';
import 'package:instagram/repository/model%20class/post%20model.dart';
import 'package:instagram/ui/followers.dart';

import '../repository/model class/insta model.dart';
import '../repository/model class/tag model.dart';

class Followingpage extends StatefulWidget {
  final String name;
  const Followingpage({super.key, required this.name});

  @override
  State<Followingpage> createState() => _HomeState();
}

class _HomeState extends State<Followingpage> {
  late InstaModel insta;
  late Highlight highlight;
  late Post postdata;
  late Tag tag;
  late Followers followers;
@override
  void initState() {
  BlocProvider.of<InstaBloc>(context).add(Fetchinsta(name: widget.name));
  BlocProvider.of<HighlightBloc>(context).add(fetchhihglight(name: widget.name));
  BlocProvider.of<PostBloc>(context).add(Fetchpost(name: widget.name));
  BlocProvider.of<TagBloc>(context).add(fetchtag(name: widget.name
  ));
    // TODO: implement initState
    super.initState(
    );
  }

  String k_m_b_generator(num) {
    if (num > 999 && num < 99999) {
      return "${(num / 1000).toStringAsFixed(1)} K";
    } else if (num > 99999 && num < 999999) {
      return "${(num / 1000).toStringAsFixed(0)} K";
    } else if (num > 999999 && num < 999999999) {
      return "${(num / 1000000).toStringAsFixed(1)} M";
    } else if (num > 999999999) {
      return "${(num / 1000000000).toStringAsFixed(1)} B";
    } else {
      return num.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: BlocBuilder<InstaBloc, InstaState>(
            builder: (context, state) {
              if (state is instaloading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is instaerror) {
                return RefreshIndicator(
                    child: Center(
                        child: Text(
                          "no internet connection",
                        )),
                    onRefresh: () async {
                      return BlocProvider.of<InstaBloc>(context)
                          .add(Fetchinsta(name: widget.name
                      ));
                    });
              }
              if (state is instaloaded) {
                insta = BlocProvider.of<InstaBloc>(context).instamodel;
                String followers = k_m_b_generator(double.parse(
                  insta.data!.followerCount.toString(),
                ));
                return SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Padding(
                          padding: EdgeInsets.only(top: 20.h),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              CircleAvatar(
                                radius: 30.r,
                                backgroundImage: NetworkImage(
                                  insta.data!.profilePicUrl.toString(),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Column(
                                children: [
                                  Text(
                                    insta.data!.mediaCount.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                  Text(
                                    'Posts',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              GestureDetector(onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Followers1(followers: followers, follownig: insta.data!.followingCount.toString(), username: insta.data!.adsPageName.toString(), username1: insta.data!.username.toString(),)));},
                                child: Column(
                                  children: [
                                    Text(
                                      followers,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.sp,
                                        fontFamily: 'Inter',
                                      ),
                                    ),
                                    Text(
                                      'followers',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.sp,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w300,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              Column(
                                children: [
                                  Text(
                                    insta.data!.followingCount.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontFamily: 'Inter',
                                    ),
                                  ),
                                  Text(
                                    'following',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Text(
                          insta.data!.username.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          insta.data!.biography.toString(),
                          style: TextStyle(
                            color: Color(0xFF8E8E8E),
                            fontSize: 14.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          'www.website.com',
                          style: TextStyle(
                            color: Color(0xFFD4E0ED),
                            fontSize: 17.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 100.w,
                              height: 25.h,
                              decoration: ShapeDecoration(
                                color: Color(0xFF4192EF),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(8.73.r),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Follow',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.05.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 100.w,
                              height: 25.h,
                              decoration: ShapeDecoration(
                                color: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(8.73.r),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Massage',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.05.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 100.w,
                              height: 25.h,
                              decoration: ShapeDecoration(
                                color: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(8.73.r),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Email',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.05.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 36.w,
                              height: 33.h,
                              decoration: ShapeDecoration(
                                color: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(5.73.r),
                                ),
                              ),
                              child: Icon(
                                BootstrapIcons.chevron_down,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.w, top: 20.h),
                          child: SizedBox(
                            height: 100.h,
                            child: BlocBuilder<HighlightBloc, HighlightState>(
                              builder: (context, state) {
                                if (state is hihglightloading) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                if (state is hihglighterror) {
                                  return RefreshIndicator(
                                      child: Text("no internet connection"),
                                      onRefresh: () async {
                                        return BlocProvider.of<HighlightBloc>(
                                            context)
                                            .add(fetchhihglight(name: widget.name));
                                      });
                                }
                                if (state is hihglightloaded) {
                                  highlight =
                                      BlocProvider.of<HighlightBloc>(context)
                                          .highlight;
                                  return ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: highlight.data!.items!.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 30.r,
                                            backgroundImage: NetworkImage(
                                                highlight
                                                    .data!
                                                    .items![index]
                                                    .coverMedia!
                                                    .croppedImageVersion!
                                                    .url
                                                    .toString()),
                                          ),
                                          Text(
                                            highlight.data!.items![index].title
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xFFFAFAFA),
                                              fontSize: 10.sp,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        width: 15.w,
                                      );
                                    },
                                  );
                                } else {
                                  return SizedBox();
                                }
                              },
                            ),
                          ),
                        ),
                        TabBar(tabs: [
                          Tab(
                              icon: Icon(
                                BootstrapIcons.grid_3x3,
                                color: Colors.white,
                              )),
                          Tab(
                            icon: Icon(
                              BootstrapIcons.person_square,
                              color: Colors.white,
                            ),
                          )
                        ]),
                        SizedBox(height: 200.h,
                            child: TabBarView(children: [
                              Container(
                                child: BlocBuilder<PostBloc, PostState>(
                                  builder: (context, state) {
                                    if (state is postloading) {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                    if (state is posterror) {
                                      return RefreshIndicator(
                                          child: Text("no internet connection"),
                                          onRefresh: () async {
                                            return BlocProvider.of<HighlightBloc>(
                                                context)
                                                .add(fetchhihglight(name: widget.name));
                                          });
                                    }
                                    if (state is postloaded) {
                                      postdata =
                                          BlocProvider.of<PostBloc>(context).post;
                                      return GridView.count(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 5,
                                        mainAxisSpacing: 5,
                                        shrinkWrap: true,
                                        children: List.generate(
                                          postdata.data!.items!.length,
                                              (index) {
                                            return Padding(
                                                padding: EdgeInsets.all(1),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(5.0.r),
                                                    ),
                                                  ),
                                                  child: Image.network(
                                                    postdata.data!.items![index]
                                                        .thumbnailUrl
                                                        .toString(),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ));
                                          },
                                        ),
                                      );
                                    } else {
                                      return SizedBox();
                                    }
                                  },
                                ),
                              ),
                              Container(child: BlocBuilder<TagBloc, TagState>(
                                  builder: (context, state) {
                                    if (state is tagloading) {
                                      return Center(child: CircularProgressIndicator());
                                    }
                                    if (state is tagerror) {
                                      return RefreshIndicator(
                                          child: Center(child: Text("no internet connection")),
                                          onRefresh: () async {
                                            return BlocProvider.of<TagBloc>(context)
                                                .add(fetchtag(name: widget.name));
                                          });
                                    }
                                    if (state is tagloaded) {
                                      tag = BlocProvider.of<TagBloc>(context).tagmodel;
                                      return GridView.count(
                                        crossAxisCount: 3,
                                        crossAxisSpacing: 5,
                                        mainAxisSpacing: 5,
                                        shrinkWrap: true,
                                        children: List.generate(
                                          tag.data!.items!.length,
                                              (index) {
                                            return Padding(
                                                padding: EdgeInsets.all(1),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(5.0),
                                                    ),
                                                  ),
                                                  child: Image.network(
                                                    tag.data!.items![index].thumbnailUrl
                                                        .toString(),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ));
                                          },
                                        ),
                                      );
                                    } else {
                                      return SizedBox();
                                    }
                                  }))
                            ]))
                      ]),
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}

