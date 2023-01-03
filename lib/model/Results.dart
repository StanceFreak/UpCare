// import 'Attributes.dart';
// import 'Categories.dart';

// class Results {
//   Results({
//     required this.externalId,
//     required this.publishDate,
//     required this.updatedAt,
//     required this.slug,
//     required this.metaKeywords,
//     required this.sourceUrl,
//     required this.imageUrl,
//     required this.thumbnailUrl,
//     required this.headline,
//     required this.title,
//     required this.categories,
//     required this.metaDescription,
//     required this.channel,
//     required this.type,
//     required this.displayOrder,
//     required this.language,
//     required this.readingTime,
//     required this.summary,
//     required this.attributes,
//   });
//   late final String externalId;
//   late final int publishDate;
//   late final int updatedAt;
//   late final String slug;
//   late final String metaKeywords;
//   late final String sourceUrl;
//   late final String imageUrl;
//   late final String thumbnailUrl;
//   late final String headline;
//   late final String title;
//   late final List<Categories> categories;
//   late final String metaDescription;
//   late final String channel;
//   late final String type;
//   late final int displayOrder;
//   late final String language;
//   late final String readingTime;
//   late final String summary;
//   late final Attributes attributes;

//   Results.fromJson(Map<String, dynamic> json) {
//     externalId = json['external_id'];
//     publishDate = json['publish_date'];
//     updatedAt = json['updated_at'];
//     slug = json['slug'];
//     metaKeywords = json['meta_keywords'];
//     sourceUrl = json['source_url'];
//     imageUrl = json['image_url'];
//     thumbnailUrl = json['thumbnail_url'];
//     headline = json['headline'];
//     title = json['title'];
//     categories = List.from(json['categories'])
//         .map((e) => Categories.fromJson(e))
//         .toList();
//     metaDescription = json['meta_description'];
//     channel = json['channel'];
//     type = json['type'];
//     displayOrder = json['display_order'];
//     language = json['language'];
//     readingTime = json['reading_time'];
//     summary = json['summary'];
//     attributes = Attributes.fromJson(json['attributes']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['external_id'] = externalId;
//     _data['publish_date'] = publishDate;
//     _data['updated_at'] = updatedAt;
//     _data['slug'] = slug;
//     _data['meta_keywords'] = metaKeywords;
//     _data['source_url'] = sourceUrl;
//     _data['image_url'] = imageUrl;
//     _data['thumbnail_url'] = thumbnailUrl;
//     _data['headline'] = headline;
//     _data['title'] = title;
//     _data['categories'] = categories.map((e) => e.toJson()).toList();
//     _data['meta_description'] = metaDescription;
//     _data['channel'] = channel;
//     _data['type'] = type;
//     _data['display_order'] = displayOrder;
//     _data['language'] = language;
//     _data['reading_time'] = readingTime;
//     _data['summary'] = summary;
//     _data['attributes'] = attributes.toJson();
//     return _data;
//   }
// }
