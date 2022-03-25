import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static const kIconKanban = 'assets/svg_icons/kanban.svg';
  static const kIconExplore = 'assets/svg_icons/explore.svg';
  static const kIconAdd = 'assets/svg_icons/add.svg';
  static const kIconAddCircle = 'assets/svg_icons/add_circle.svg';
  static const kIconAddSubtask = 'assets/svg_icons/add_subtask.svg';
  static const kIconAnyDo = 'assets/svg_icons/any_do.svg';
  static const kIconApple = 'assets/svg_icons/apple.svg';
  static const kIconArrowBack = 'assets/svg_icons/arrow_back.svg';
  static const kIconArrowCircleRight =
      'assets/svg_icons/arrow_circle_right.svg';
  static const kIconArrowDown = 'assets/svg_icons/arrow_down.svg';
  static const kIconArrowLeftBold = 'assets/svg_icons/arrow_left_bold.svg';
  static const kIconArrowRight = 'assets/svg_icons/arrow_right.svg';
  static const kIconArrowRightBold = 'assets/svg_icons/arrow_right_bold.svg';
  static const kIconArrowUp = 'assets/svg_icons/arrow_up.svg';
  static const kIconAttachment = 'assets/svg_icons/attachment.svg';
  static const kIconBack = 'assets/svg_icons/back.svg';
  static const kIconBellOn = 'assets/svg_icons/bell_on.svg';
  static const kIconBoard = 'assets/svg_icons/board.svg';
  static const kIconCalendar = 'assets/svg_icons/calendar.svg';
  static const kIconCalendar31 = 'assets/svg_icons/calendar_31.svg';
  static const kIconCamera = 'assets/svg_icons/camera.svg';
  static const kIconChat = 'assets/svg_icons/chat.svg';
  static const kIconCheckTwo = 'assets/svg_icons/check_two.svg';
  static const kIconCheckbox = 'assets/svg_icons/checkbox.svg';
  static const kIconCheckboxCircle = 'assets/svg_icons/checkbox_circle.svg';
  static const kIconCheckCircleEmpty =
      'assets/svg_icons/check_circle_empty.svg';
  static const kIconCloseCircle = 'assets/svg_icons/close-circle.svg';
  static const kIconCloseEye = 'assets/svg_icons/closeEye.svg';
  static const kIconDelete = 'assets/svg_icons/delete.svg';
  static const kIconDuplicate = 'assets/svg_icons/duplicate.svg';
  static const kIconEdit = 'assets/svg_icons/edit.svg';
  static const kIconError = 'assets/svg_icons/error.svg';
  static const kIconEye = 'assets/svg_icons/eye.svg';
  static const kIconFacebook = 'assets/svg_icons/facebook.svg';
  static const kIconFile = 'assets/svg_icons/file.svg';
  static const kIconFileFill = 'assets/svg_icons/file_fill.svg';
  static const kIconFilter = 'assets/svg_icons/filter_icon.svg';
  static const kIconFolderNotch = 'assets/svg_icons/folder_notch.svg';
  static const kIconGoogle = 'assets/svg_icons/google.svg';
  static const kIconGoogleVoice = 'assets/svg_icons/google_voice.svg';
  static const kIconIn = 'assets/svg_icons/in.svg';
  static const kIconIntegration = 'assets/svg_icons/integration.svg';
  static const kIconJournal = 'assets/svg_icons/journal.svg';
  static const kIconLike = 'assets/svg_icons/like.svg';
  static const kIconLing = 'assets/svg_icons/link.svg';
  static const kIconList = 'assets/svg_icons/list.svg';
  static const kIconLock = 'assets/svg_icons/lock.svg';
  static const kIconMenu1 = 'assets/svg_icons/menu_1.svg';
  static const kIconMenu2 = 'assets/svg_icons/menu_2.svg';
  static const kIconMicro = 'assets/svg_icons/micro.svg';
  static const kIconMymir = 'assets/svg_icons/mymir.svg';
  static const kIconNineDot = 'assets/svg_icons/nine_dot.svg';
  static const kIconNotification = 'assets/svg_icons/notification_icon.svg';
  static const kIconOther = 'assets/svg_icons/other.svg';
  static const kIconPinIt = 'assets/svg_icons/pin_it.svg';
  static const kIconPlan = 'assets/svg_icons/plan.svg';
  static const kIconPlay = 'assets/svg_icons/play.svg';
  static const kIconPost = 'assets/svg_icons/post.svg';
  static const kIconPriority = 'assets/svg_icons/priority.svg';
  static const kIconPushPin = 'assets/svg_icons/push_pin.svg';
  static const kIconQrScan = 'assets/svg_icons/qr_scan.svg';
  static const kIconRepeat = 'assets/svg_icons/repeat.svg';
  static const kIconSearch = 'assets/svg_icons/search.svg';
  static const kIconSend = 'assets/svg_icons/send.svg';
  static const kIconSetting = 'assets/svg_icons/setting.svg';
  static const kIconStop = 'assets/svg_icons/stop.svg';
  static const kIconTag = 'assets/svg_icons/tag.svg';
  static const kIconTime = 'assets/svg_icons/time.svg';
  static const kIconTime2 = 'assets/svg_icons/time_2.svg';
  static const kIconTimeAdd = 'assets/svg_icons/time_add.svg';
  static const kIconTodoList = 'assets/svg_icons/todo_list.svg';
  static const kIconTray = 'assets/svg_icons/tray.svg';
  static const kIconUserAdd = 'assets/svg_icons/user_add.svg';
  static const kIconUserCircle = 'assets/svg_icons/user_circle.svg';
  static const kIconVK = 'assets/svg_icons/vk.svg';
  static const kIconYandex = 'assets/svg_icons/yandex.svg';
  static const kIconWarn = 'assets/svg_icons/warn.svg';
  static const kIconZapier = 'assets/svg_icons/zapier.svg';
  static const kIconAmazon = 'assets/svg_icons/amazon.svg';
  static const kIconLogo = 'assets/svg_icons/logo_icon.svg';

  const AppIcons._();
}

class CustomIcon extends StatelessWidget {
  final String customIcon;
  final Color? color;
  final double? width;
  final double? height;

  const CustomIcon({
    required this.customIcon,
    this.color,
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      customIcon,
      color: color,
      width: width,
      height: height,
    );
  }
}
