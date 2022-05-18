class Element {
  late final ElementResult result;

  Element({
    required this.result,
  });

  Element.fromJson(Map<String, dynamic> json) {
    result = ElementResult.fromJson(json['result'] as Map<String, dynamic>);
  }
}

class ElementResult {
  late final MiInfo miInfo;
  late final VriInfo vriInfo;
  ElementResult({
    required this.miInfo,
    required this.vriInfo,
  });

  ElementResult.fromJson(Map<String, dynamic> json) {
    miInfo = MiInfo.fromJson(json['miInfo'] as Map<String, dynamic>);
    vriInfo = VriInfo.fromJson(json['vriInfo'] as Map<String, dynamic>);
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
}

class SingleMI {
  late final String? mitypeNumber;
  late final String? mitypeURL;
  late final String? mitypeType;
  late final String? mitypeTitle;
  late final String? manufactureNum;
  late final String? modification;
  SingleMI({
    required this.mitypeNumber,
    required this.mitypeURL,
    required this.mitypeType,
    required this.mitypeTitle,
    required this.manufactureNum,
    required this.modification,
  });

  SingleMI.fromJson(Map<String, dynamic> json) {
    if (json['mitypeNumber'] != null) {
      mitypeNumber = json['mitypeNumber'] as String;
    } else {
      mitypeNumber = '';
    }
    if (json['mitypeURL'] != null) {
      mitypeURL = json['mitypeURL'] as String;
    } else {
      mitypeURL = '';
    }
    if (json['mitypeType'] != null) {
      mitypeType = json['mitypeType'] as String;
    } else {
      mitypeType = '';
    }
    if (json['mitypeTitle'] != null) {
      mitypeTitle = json['mitypeTitle'] as String;
    } else {
      mitypeTitle = '';
    }
    if (json['manufactureNum'] != null) {
      manufactureNum = json['manufactureNum'] as String;
    } else {
      manufactureNum = '';
    }
    if (json['modification'] != null) {
      modification = json['modification'] as String;
    } else {
      modification = '';
    }
  }
}

class VriInfo {
  late final String? organization;
  late final String? signCipher;
  late final String? miOwner;
  late final String? vrfDate;
  late final String? validDate;
  late final String? vriType;
  late final String? docTitle;
  late final Applicable? applicable;
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
    if (json['organization'] != null) {
      organization = json['organization'] as String;
    } else {
      organization = '';
    }
    if (json['signCipher'] != null) {
      signCipher = json['signCipher'] as String;
    } else {
      signCipher = '';
    }
    if (json['miOwner'] != null) {
      miOwner = json['miOwner'] as String;
    } else {
      miOwner = '';
    }
    if (json['vrfDate'] != null) {
      vrfDate = json['vrfDate'] as String;
    } else {
      vrfDate = '';
    }
    if (json['validDate'] != null) {
      validDate = json['validDate'] as String;
    } else {
      validDate = '';
    }
    if (json['vriType'] != null) {
      vriType = json['vriType'] as String;
    } else {
      vriType = '';
    }
    if (json['docTitle'] != null) {
      docTitle = json['docTitle'] as String;
    } else {
      docTitle = '';
    }
    if (json['applicable'] != null) {
      applicable =
          Applicable.fromJson(json['applicable'] as Map<String, dynamic>);
    } else {
      applicable = Applicable(
        certNum: '',
        signMi: false,
        signPass: false,
        stickerNum: '',
      );
    }
  }
}

class Applicable {
  late final String? certNum;
  late final String? stickerNum;
  late final bool signPass;
  late final bool signMi;
  Applicable({
    required this.certNum,
    required this.stickerNum,
    required this.signPass,
    required this.signMi,
  });

  Applicable.fromJson(Map<String, dynamic> json) {
    if (json['certNum'] != null) {
      certNum = json['certNum'] as String?;
    } else {
      certNum = '';
    }
    if (json['stickerNum'] != null) {
      stickerNum = json['stickerNum'] as String;
    } else {
      stickerNum = '';
    }
  }
}
