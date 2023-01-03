class MedicineListResponse {
  MedicineListResponse({
    required this.result,
    required this.nextPage,
    this.totalHits,
    this.totalCount,
  });
  late final List<Result> result;
  late final bool nextPage;
  late final Null totalHits;
  late final Null totalCount;

  MedicineListResponse.fromJson(Map<String, dynamic> json) {
    result = List.from(json['result']).map((e) => Result.fromJson(e)).toList();
    nextPage = json['next_page'];
    totalHits = null;
    totalCount = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['result'] = result.map((e) => e.toJson()).toList();
    _data['next_page'] = nextPage;
    _data['total_hits'] = totalHits;
    _data['total_count'] = totalCount;
    return _data;
  }
}

class Result {
  Result({
    required this.externalId,
    required this.slug,
    this.canonSlug,
    required this.name,
    required this.imageUrl,
    required this.thumbnailUrl,
    required this.minPrice,
    required this.basePrice,
    required this.sellingUnit,
    required this.prescriptionRequired,
    required this.consultationRequired,
    this.controlledSubstanceType,
    required this.visualCues,
    required this.imagesMap,
    this.generalIndication,
  });
  late final String externalId;
  late final String slug;
  late final Null canonSlug;
  late final String name;
  late final String imageUrl;
  late final String thumbnailUrl;
  late final int minPrice;
  late final int basePrice;
  late final String sellingUnit;
  late final bool prescriptionRequired;
  late final bool consultationRequired;
  late final String? controlledSubstanceType;
  late final List<String> visualCues;
  late final ImagesMap imagesMap;
  late final Null generalIndication;

  Result.fromJson(Map<String, dynamic> json) {
    externalId = json['external_id'];
    slug = json['slug'];
    canonSlug = null;
    name = json['name'];
    imageUrl = json['image_url'];
    thumbnailUrl = json['thumbnail_url'];
    minPrice = json['min_price'];
    basePrice = json['base_price'];
    sellingUnit = json['selling_unit'];
    prescriptionRequired = json['prescription_required'];
    consultationRequired = json['consultation_required'];
    controlledSubstanceType = null;
    visualCues = List.castFrom<dynamic, String>(json['visual_cues']);
    imagesMap = ImagesMap.fromJson(json['images_map']);
    generalIndication = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['external_id'] = externalId;
    _data['slug'] = slug;
    _data['canon_slug'] = canonSlug;
    _data['name'] = name;
    _data['image_url'] = imageUrl;
    _data['thumbnail_url'] = thumbnailUrl;
    _data['min_price'] = minPrice;
    _data['base_price'] = basePrice;
    _data['selling_unit'] = sellingUnit;
    _data['prescription_required'] = prescriptionRequired;
    _data['consultation_required'] = consultationRequired;
    _data['controlled_substance_type'] = controlledSubstanceType;
    _data['visual_cues'] = visualCues;
    _data['images_map'] = imagesMap.toJson();
    _data['general_indication'] = generalIndication;
    return _data;
  }
}

class ImagesMap {
  ImagesMap({
    required this.imageUrl,
    required this.thumbnailUrl,
  });
  late final List<ImageUrl> imageUrl;
  late final List<ThumbnailUrl> thumbnailUrl;

  ImagesMap.fromJson(Map<String, dynamic> json) {
    imageUrl =
        List.from(json['image_url']).map((e) => ImageUrl.fromJson(e)).toList();
    thumbnailUrl = List.from(json['thumbnail_url'])
        .map((e) => ThumbnailUrl.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image_url'] = imageUrl.map((e) => e.toJson()).toList();
    _data['thumbnail_url'] = thumbnailUrl.map((e) => e.toJson()).toList();
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

class ThumbnailUrl {
  ThumbnailUrl({
    required this.extension,
    required this.url,
  });
  late final String extension;
  late final String url;

  ThumbnailUrl.fromJson(Map<String, dynamic> json) {
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
