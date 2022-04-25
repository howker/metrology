class Item {
  late final Result result;
  Item({
    required this.result,
  });

  Item.fromJson(Map<String, dynamic> json) {
    result = Result.fromJson(json['result'] as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['result'] = result.toJson();
    return data;
  }
}

class Result {
  late final int count;
  late final int start;
  late final int rows;
  late final List<Items> items;
  Result({
    required this.count,
    required this.start,
    required this.rows,
    required this.items,
  });

  Result.fromJson(Map<String, dynamic> json) {
    count = json['count'] as int;
    start = json['start'] as int;
    rows = json['rows'] as int;

    items = List<dynamic>.from(json['items'] as Iterable)
        // ignore: avoid_annotating_with_dynamic
        .map((dynamic e) => Items.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['count'] = count;
    data['start'] = start;
    data['rows'] = rows;
    data['items'] = items.map((e) => e.toJson()).toList();
    return data;
  }
}

class Items {
  late final String? vriId;
  late final String? orgTitle;
  late final String? mitNumber;
  late final String? mitTitle;
  late final String? mitNotation;
  late final String? miModification;
  late final String? miNumber;
  late final String? verificationDate;
  late final String? validDate;
  late final String? resultDocnum;
  late final bool? applicability;
  bool isSelected = false;
  bool isFavorite = false;
  Items({
    required this.vriId,
    required this.orgTitle,
    required this.mitNumber,
    required this.mitTitle,
    required this.mitNotation,
    required this.miModification,
    required this.miNumber,
    required this.verificationDate,
    required this.validDate,
    required this.resultDocnum,
    required this.applicability,
  });

  Items.fromJson(Map<String, dynamic> json) {
    vriId = json['vri_id'] as String?;
    orgTitle = json['org_title'] as String?;
    mitNumber = json['mit_number'] as String?;
    mitTitle = json['mit_title'] as String?;
    mitNotation = json['mit_notation'] as String?;
    miModification = json['mi_modification'] as String?;
    miNumber = json['mi_number'] as String?;
    verificationDate = json['verification_date'] as String?;
    validDate = json['valid_date'] as String?;
    resultDocnum = json['result_docnum'] as String?;
    applicability = json['applicability'] as bool?;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['vri_id'] = vriId;
    data['org_title'] = orgTitle;
    data['mit_number'] = mitNumber;
    data['mit_title'] = mitTitle;
    data['mit_notation'] = mitNotation;
    data['mi_modification'] = miModification;
    data['mi_number'] = miNumber;
    data['verification_date'] = verificationDate;
    data['valid_date'] = validDate;
    data['result_docnum'] = resultDocnum;
    data['applicability'] = applicability;
    return data;
  }
}
