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
    required this.isSelected,
    required this.isFavorite,
  });

  Items.fromJson(Map<String, dynamic> json) {
    if (json['vri_id'] != null) {
      vriId = json['vri_id'] as String;
    } else {
      vriId = '';
    }
    if (json['org_title'] != null) {
      orgTitle = json['org_title'] as String;
    } else {
      orgTitle = '';
    }
    if (json['mit_number'] != null) {
      mitNumber = json['mit_number'] as String;
    } else {
      mitNumber = '';
    }
    if (json['mit_title'] != null) {
      mitTitle = json['mit_title'] as String;
    } else {
      mitTitle = '';
    }
    if (json['mit_notation'] != null) {
      mitNotation = json['mit_notation'] as String;
    } else {
      mitNotation = '';
    }
    if (json['mi_modification'] != null) {
      miModification = json['mi_modification'] as String;
    } else {
      miModification = '';
    }
    if (json['mi_number'] != null) {
      miNumber = json['mi_number'] as String;
    } else {
      miNumber = '';
    }
    if (json['verification_date'] != null) {
      verificationDate = json['verification_date'] as String;
    } else {
      verificationDate = '';
    }
    if (json['valid_date'] != null) {
      validDate = json['valid_date'] as String;
    } else {
      validDate = '';
    }
    if (json['result_docnum'] != null) {
      resultDocnum = json['result_docnum'] as String;
    } else {
      resultDocnum = '';
    }
    if (json['applicability'] != null) {
      applicability = json['applicability'] as bool;
    } else {
      applicability = false;
    }
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
