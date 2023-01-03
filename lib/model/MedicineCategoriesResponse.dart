class MedicineCategoriesResponse {
  MedicineCategoriesResponse({
    required this.results,
  });
  late final List<Results> results;

  MedicineCategoriesResponse.fromJson(Map<String, dynamic> json) {
    results =
        List.from(json['results']).map((e) => Results.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['results'] = results.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Results {
  Results({
    required this.externalId,
    required this.slug,
    this.canonSlug,
    required this.imageUrl,
    required this.attributes,
    required this.imagesMap,
  });
  late final String externalId;
  late final String slug;
  late final Null canonSlug;
  late final String imageUrl;
  late final Attributes attributes;
  late final ImagesMap imagesMap;

  Results.fromJson(Map<String, dynamic> json) {
    externalId = json['external_id'];
    slug = json['slug'];
    canonSlug = null;
    imageUrl = json['image_url'];
    attributes = Attributes.fromJson(json['attributes']);
    imagesMap = ImagesMap.fromJson(json['images_map']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['external_id'] = externalId;
    _data['slug'] = slug;
    _data['canon_slug'] = canonSlug;
    _data['image_url'] = imageUrl;
    _data['attributes'] = attributes.toJson();
    _data['images_map'] = imagesMap.toJson();
    return _data;
  }
}

class Attributes {
  Attributes({
    required this.metaDescription,
    required this.seoUrl,
    required this.metaTitle,
    required this.name,
    required this.metaKeywords,
  });
  late final String metaDescription;
  late final String seoUrl;
  late final String metaTitle;
  late final String name;
  late final String metaKeywords;

  Attributes.fromJson(Map<String, dynamic> json) {
    metaDescription = json['meta_description'];
    seoUrl = json['seo_url'];
    metaTitle = json['meta_title'];
    name = json['name'];
    metaKeywords = json['meta_keywords'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['meta_description'] = metaDescription;
    _data['seo_url'] = seoUrl;
    _data['meta_title'] = metaTitle;
    _data['name'] = name;
    _data['meta_keywords'] = metaKeywords;
    return _data;
  }
}

class ImagesMap {
  ImagesMap({
    required this.imageUrl,
  });
  late final List<ImageUrl> imageUrl;

  ImagesMap.fromJson(Map<String, dynamic> json) {
    imageUrl =
        List.from(json['image_url']).map((e) => ImageUrl.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image_url'] = imageUrl.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ImageUrl {
  ImageUrl({
    required this.extension,
    required this.url,
  });
  late final String extension;
  late final String url;

  ImageUrl.fromJson(Map<String, dynamic> json) {
    extension = json['extension'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['extension'] = extension;
    _data['url'] = url;
    return _data;
  }
}
