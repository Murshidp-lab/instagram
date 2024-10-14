
class Highlight {
  Data? data;

  Highlight({this.data});

  Highlight.fromJson(Map<String, dynamic> json) {
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  static List<Highlight> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Highlight.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }

  Highlight copyWith({
    Data? data,
  }) => Highlight(
    data: data ?? this.data,
  );
}

class Data {
  List<Items>? items;
  String? highlightsTrayType;
  int? count;

  Data({this.items, this.highlightsTrayType, this.count});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["items"] is List) {
      items = json["items"] == null ? null : (json["items"] as List).map((e) => Items.fromJson(e)).toList();
    }
    if(json["highlights_tray_type"] is String) {
      highlightsTrayType = json["highlights_tray_type"];
    }
    if(json["count"] is num) {
      count = (json["count"] as num).toInt();
    }
  }

  static List<Data> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Data.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    _data["highlights_tray_type"] = highlightsTrayType;
    _data["count"] = count;
    return _data;
  }

  Data copyWith({
    List<Items>? items,
    String? highlightsTrayType,
    int? count,
  }) => Data(
    items: items ?? this.items,
    highlightsTrayType: highlightsTrayType ?? this.highlightsTrayType,
    count: count ?? this.count,
  );
}

class Items {
  String? id;
  int? latestReelMedia;
  bool? canReply;
  bool? canGifQuickReply;
  dynamic canReshare;
  String? reelType;
  dynamic adExpiryTimestampInMillis;
  dynamic isCtaStickerAvailable;
  dynamic appStickerInfo;
  dynamic shouldTreatLinkStickerAsCta;
  dynamic poolRefreshTtlInSec;
  bool? canReactWithAvatar;
  CoverMedia? coverMedia;
  User? user;
  int? rankedPosition;
  String? title;
  int? createdAt;
  bool? isPinnedHighlight;
  int? seenRankedPosition;
  int? prefetchCount;
  int? mediaCount;
  bool? isConvertedToClips;
  List<String>? disabledReplyTypes;
  String? highlightReelType;
  bool? isAddedToMainGrid;
  int? updatedTimestamp;
  bool? isArchived;

  Items({this.id, this.latestReelMedia, this.canReply, this.canGifQuickReply, this.canReshare, this.reelType, this.adExpiryTimestampInMillis, this.isCtaStickerAvailable, this.appStickerInfo, this.shouldTreatLinkStickerAsCta, this.poolRefreshTtlInSec, this.canReactWithAvatar, this.coverMedia, this.user, this.rankedPosition, this.title, this.createdAt, this.isPinnedHighlight, this.seenRankedPosition, this.prefetchCount, this.mediaCount, this.isConvertedToClips, this.disabledReplyTypes, this.highlightReelType, this.isAddedToMainGrid, this.updatedTimestamp, this.isArchived});

  Items.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["latest_reel_media"] is num) {
      latestReelMedia = (json["latest_reel_media"] as num).toInt();
    }
    if(json["can_reply"] is bool) {
      canReply = json["can_reply"];
    }
    if(json["can_gif_quick_reply"] is bool) {
      canGifQuickReply = json["can_gif_quick_reply"];
    }
    canReshare = json["can_reshare"];
    if(json["reel_type"] is String) {
      reelType = json["reel_type"];
    }
    adExpiryTimestampInMillis = json["ad_expiry_timestamp_in_millis"];
    isCtaStickerAvailable = json["is_cta_sticker_available"];
    appStickerInfo = json["app_sticker_info"];
    shouldTreatLinkStickerAsCta = json["should_treat_link_sticker_as_cta"];
    poolRefreshTtlInSec = json["pool_refresh_ttl_in_sec"];
    if(json["can_react_with_avatar"] is bool) {
      canReactWithAvatar = json["can_react_with_avatar"];
    }
    if(json["cover_media"] is Map) {
      coverMedia = json["cover_media"] == null ? null : CoverMedia.fromJson(json["cover_media"]);
    }
    if(json["user"] is Map) {
      user = json["user"] == null ? null : User.fromJson(json["user"]);
    }
    if(json["ranked_position"] is num) {
      rankedPosition = (json["ranked_position"] as num).toInt();
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["created_at"] is num) {
      createdAt = (json["created_at"] as num).toInt();
    }
    if(json["is_pinned_highlight"] is bool) {
      isPinnedHighlight = json["is_pinned_highlight"];
    }
    if(json["seen_ranked_position"] is num) {
      seenRankedPosition = (json["seen_ranked_position"] as num).toInt();
    }
    if(json["prefetch_count"] is num) {
      prefetchCount = (json["prefetch_count"] as num).toInt();
    }
    if(json["media_count"] is num) {
      mediaCount = (json["media_count"] as num).toInt();
    }
    if(json["is_converted_to_clips"] is bool) {
      isConvertedToClips = json["is_converted_to_clips"];
    }
    if(json["disabled_reply_types"] is List) {
      disabledReplyTypes = json["disabled_reply_types"] == null ? null : List<String>.from(json["disabled_reply_types"]);
    }
    if(json["highlight_reel_type"] is String) {
      highlightReelType = json["highlight_reel_type"];
    }
    if(json["is_added_to_main_grid"] is bool) {
      isAddedToMainGrid = json["is_added_to_main_grid"];
    }
    if(json["updated_timestamp"] is num) {
      updatedTimestamp = (json["updated_timestamp"] as num).toInt();
    }
    if(json["is_archived"] is bool) {
      isArchived = json["is_archived"];
    }
  }

  static List<Items> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Items.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["latest_reel_media"] = latestReelMedia;
    _data["can_reply"] = canReply;
    _data["can_gif_quick_reply"] = canGifQuickReply;
    _data["can_reshare"] = canReshare;
    _data["reel_type"] = reelType;
    _data["ad_expiry_timestamp_in_millis"] = adExpiryTimestampInMillis;
    _data["is_cta_sticker_available"] = isCtaStickerAvailable;
    _data["app_sticker_info"] = appStickerInfo;
    _data["should_treat_link_sticker_as_cta"] = shouldTreatLinkStickerAsCta;
    _data["pool_refresh_ttl_in_sec"] = poolRefreshTtlInSec;
    _data["can_react_with_avatar"] = canReactWithAvatar;
    if(coverMedia != null) {
      _data["cover_media"] = coverMedia?.toJson();
    }
    if(user != null) {
      _data["user"] = user?.toJson();
    }
    _data["ranked_position"] = rankedPosition;
    _data["title"] = title;
    _data["created_at"] = createdAt;
    _data["is_pinned_highlight"] = isPinnedHighlight;
    _data["seen_ranked_position"] = seenRankedPosition;
    _data["prefetch_count"] = prefetchCount;
    _data["media_count"] = mediaCount;
    _data["is_converted_to_clips"] = isConvertedToClips;
    if(disabledReplyTypes != null) {
      _data["disabled_reply_types"] = disabledReplyTypes;
    }
    _data["highlight_reel_type"] = highlightReelType;
    _data["is_added_to_main_grid"] = isAddedToMainGrid;
    _data["updated_timestamp"] = updatedTimestamp;
    _data["is_archived"] = isArchived;
    return _data;
  }

  Items copyWith({
    String? id,
    int? latestReelMedia,
    bool? canReply,
    bool? canGifQuickReply,
    dynamic canReshare,
    String? reelType,
    dynamic adExpiryTimestampInMillis,
    dynamic isCtaStickerAvailable,
    dynamic appStickerInfo,
    dynamic shouldTreatLinkStickerAsCta,
    dynamic poolRefreshTtlInSec,
    bool? canReactWithAvatar,
    CoverMedia? coverMedia,
    User? user,
    int? rankedPosition,
    String? title,
    int? createdAt,
    bool? isPinnedHighlight,
    int? seenRankedPosition,
    int? prefetchCount,
    int? mediaCount,
    bool? isConvertedToClips,
    List<String>? disabledReplyTypes,
    String? highlightReelType,
    bool? isAddedToMainGrid,
    int? updatedTimestamp,
    bool? isArchived,
  }) => Items(
    id: id ?? this.id,
    latestReelMedia: latestReelMedia ?? this.latestReelMedia,
    canReply: canReply ?? this.canReply,
    canGifQuickReply: canGifQuickReply ?? this.canGifQuickReply,
    canReshare: canReshare ?? this.canReshare,
    reelType: reelType ?? this.reelType,
    adExpiryTimestampInMillis: adExpiryTimestampInMillis ?? this.adExpiryTimestampInMillis,
    isCtaStickerAvailable: isCtaStickerAvailable ?? this.isCtaStickerAvailable,
    appStickerInfo: appStickerInfo ?? this.appStickerInfo,
    shouldTreatLinkStickerAsCta: shouldTreatLinkStickerAsCta ?? this.shouldTreatLinkStickerAsCta,
    poolRefreshTtlInSec: poolRefreshTtlInSec ?? this.poolRefreshTtlInSec,
    canReactWithAvatar: canReactWithAvatar ?? this.canReactWithAvatar,
    coverMedia: coverMedia ?? this.coverMedia,
    user: user ?? this.user,
    rankedPosition: rankedPosition ?? this.rankedPosition,
    title: title ?? this.title,
    createdAt: createdAt ?? this.createdAt,
    isPinnedHighlight: isPinnedHighlight ?? this.isPinnedHighlight,
    seenRankedPosition: seenRankedPosition ?? this.seenRankedPosition,
    prefetchCount: prefetchCount ?? this.prefetchCount,
    mediaCount: mediaCount ?? this.mediaCount,
    isConvertedToClips: isConvertedToClips ?? this.isConvertedToClips,
    disabledReplyTypes: disabledReplyTypes ?? this.disabledReplyTypes,
    highlightReelType: highlightReelType ?? this.highlightReelType,
    isAddedToMainGrid: isAddedToMainGrid ?? this.isAddedToMainGrid,
    updatedTimestamp: updatedTimestamp ?? this.updatedTimestamp,
    isArchived: isArchived ?? this.isArchived,
  );
}

class User {
  String? id;
  String? fullName;
  bool? isPrivate;
  String? username;
  bool? isVerified;
  String? profilePicId;
  String? profilePicUrl;

  User({this.id, this.fullName, this.isPrivate, this.username, this.isVerified, this.profilePicId, this.profilePicUrl});

  User.fromJson(Map<String, dynamic> json) {
    if(json["id"] is String) {
      id = json["id"];
    }
    if(json["full_name"] is String) {
      fullName = json["full_name"];
    }
    if(json["is_private"] is bool) {
      isPrivate = json["is_private"];
    }
    if(json["username"] is String) {
      username = json["username"];
    }
    if(json["is_verified"] is bool) {
      isVerified = json["is_verified"];
    }
    if(json["profile_pic_id"] is String) {
      profilePicId = json["profile_pic_id"];
    }
    if(json["profile_pic_url"] is String) {
      profilePicUrl = json["profile_pic_url"];
    }
  }

  static List<User> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => User.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["full_name"] = fullName;
    _data["is_private"] = isPrivate;
    _data["username"] = username;
    _data["is_verified"] = isVerified;
    _data["profile_pic_id"] = profilePicId;
    _data["profile_pic_url"] = profilePicUrl;
    return _data;
  }

  User copyWith({
    String? id,
    String? fullName,
    bool? isPrivate,
    String? username,
    bool? isVerified,
    String? profilePicId,
    String? profilePicUrl,
  }) => User(
    id: id ?? this.id,
    fullName: fullName ?? this.fullName,
    isPrivate: isPrivate ?? this.isPrivate,
    username: username ?? this.username,
    isVerified: isVerified ?? this.isVerified,
    profilePicId: profilePicId ?? this.profilePicId,
    profilePicUrl: profilePicUrl ?? this.profilePicUrl,
  );
}

class CoverMedia {
  CroppedImageVersion? croppedImageVersion;
  dynamic cropRect;
  dynamic id;
  dynamic fullImageVersion;
  dynamic uploadId;

  CoverMedia({this.croppedImageVersion, this.cropRect, this.id, this.fullImageVersion, this.uploadId});

  CoverMedia.fromJson(Map<String, dynamic> json) {
    if(json["cropped_image_version"] is Map) {
      croppedImageVersion = json["cropped_image_version"] == null ? null : CroppedImageVersion.fromJson(json["cropped_image_version"]);
    }
    cropRect = json["crop_rect"];
    id = json["id"];
    fullImageVersion = json["full_image_version"];
    uploadId = json["upload_id"];
  }

  static List<CoverMedia> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => CoverMedia.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(croppedImageVersion != null) {
      _data["cropped_image_version"] = croppedImageVersion?.toJson();
    }
    _data["crop_rect"] = cropRect;
    _data["id"] = id;
    _data["full_image_version"] = fullImageVersion;
    _data["upload_id"] = uploadId;
    return _data;
  }

  CoverMedia copyWith({
    CroppedImageVersion? croppedImageVersion,
    dynamic cropRect,
    dynamic id,
    dynamic fullImageVersion,
    dynamic uploadId,
  }) => CoverMedia(
    croppedImageVersion: croppedImageVersion ?? this.croppedImageVersion,
    cropRect: cropRect ?? this.cropRect,
    id: id ?? this.id,
    fullImageVersion: fullImageVersion ?? this.fullImageVersion,
    uploadId: uploadId ?? this.uploadId,
  );
}

class CroppedImageVersion {
  int? width;
  int? height;
  String? url;

  CroppedImageVersion({this.width, this.height, this.url});

  CroppedImageVersion.fromJson(Map<String, dynamic> json) {
    if(json["width"] is num) {
      width = (json["width"] as num).toInt();
    }
    if(json["height"] is num) {
      height = (json["height"] as num).toInt();
    }
    if(json["url"] is String) {
      url = json["url"];
    }
  }

  static List<CroppedImageVersion> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => CroppedImageVersion.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["width"] = width;
    _data["height"] = height;
    _data["url"] = url;
    return _data;
  }

  CroppedImageVersion copyWith({
    int? width,
    int? height,
    String? url,
  }) => CroppedImageVersion(
    width: width ?? this.width,
    height: height ?? this.height,
    url: url ?? this.url,
  );
}