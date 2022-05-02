class Element {
  late final Result result;

  Element({
    required this.result,
  });

  Element.fromJson(Map<String, dynamic> json) {
    result = Result.fromJson(json['result'] as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['result'] = result.toJson();
    return data;
  }
}

class Result {
  late final MiInfo miInfo;
  late final VriInfo vriInfo;
  Result({
    required this.miInfo,
    required this.vriInfo,
  });

  Result.fromJson(Map<String, dynamic> json) {
    miInfo = MiInfo.fromJson(json['miInfo'] as Map<String, dynamic>);
    vriInfo = VriInfo.fromJson(json['vriInfo'] as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['miInfo'] = miInfo.toJson();
    data['vriInfo'] = vriInfo.toJson();
    return data;
  }
}

class MiInfo {
  late final SingleMI singleMI;
  MiInfo({
    required this.singleMI,
  });

  MiInfo.fromJson(Map<String, dynamic> json) {
    singleMI = SingleMI.fromJson(json['singleMI'] as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['singleMI'] = singleMI.toJson();
    return data;
  }
}

class SingleMI {
  late final String mitypeNumber;
  late final String mitypeURL;
  late final String mitypeType;
  late final String mitypeTitle;
  late final String manufactureNum;
  late final String modification;
  SingleMI({
    required this.mitypeNumber,
    required this.mitypeURL,
    required this.mitypeType,
    required this.mitypeTitle,
    required this.manufactureNum,
    required this.modification,
  });

  SingleMI.fromJson(Map<String, dynamic> json) {
    mitypeNumber = json['mitypeNumber'] as String;
    mitypeURL = json['mitypeURL'] as String;
    mitypeType = json['mitypeType'] as String;
    mitypeTitle = json['mitypeTitle'] as String;
    manufactureNum = json['manufactureNum'] as String;
    modification = json['modification'] as String;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['mitypeNumber'] = mitypeNumber;
    data['mitypeURL'] = mitypeURL;
    data['mitypeType'] = mitypeType;
    data['mitypeTitle'] = mitypeTitle;
    data['manufactureNum'] = manufactureNum;
    data['modification'] = modification;
    return data;
  }
}

class VriInfo {
  late final String organization;
  late final String signCipher;
  late final String miOwner;
  late final String vrfDate;
  late final String validDate;
  late final String vriType;
  late final String docTitle;
  late final Applicable applicable;
  VriInfo({
    required this.organization,
    required this.signCipher,
    required this.miOwner,
    required this.vrfDate,
    required this.validDate,
    required this.vriType,
    required this.docTitle,
    required this.applicable,
  });

  VriInfo.fromJson(Map<String, dynamic> json) {
    organization = json['organization'] as String;
    signCipher = json['signCipher'] as String;
    miOwner = json['miOwner'] as String;
    vrfDate = json['vrfDate'] as String;
    validDate = json['validDate'] as String;
    vriType = json['vriType'] as String;
    docTitle = json['docTitle'] as String;
    if (json['applicable'] != null) {
      applicable =
          Applicable.fromJson(json['applicable'] as Map<String, dynamic>);
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['organization'] = organization;
    data['signCipher'] = signCipher;
    data['miOwner'] = miOwner;
    data['vrfDate'] = vrfDate;
    data['validDate'] = validDate;
    data['vriType'] = vriType;
    data['docTitle'] = docTitle;
    data['applicable'] = applicable.toJson();
    return data;
  }
}

class Applicable {
  late final String certNum;
  late final String stickerNum;
  late final bool signPass;
  late final bool signMi;
  Applicable({
    required this.certNum,
    required this.stickerNum,
    required this.signPass,
    required this.signMi,
  });

  Applicable.fromJson(Map<String, dynamic> json) {
    certNum = json['certNum'] as String;
    stickerNum = json['stickerNum'] as String;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['certNum'] = certNum;
    data['stickerNum'] = stickerNum;

    return data;
  }
}
