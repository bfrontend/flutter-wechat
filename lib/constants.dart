
import 'package:flutter/material.dart';

class AppColors {
  static const AppBarColor = 0xff303030;
  static const TabIconActive = 0xff46c11b;
  static const TabIconNormal = 0xff999999;
  static const AppBarPopupMenuTextColor = 0xffffffff;
  static const TitleTextColor = 0xff353535;
  static const ConversationItemBg = 0xffffffff;
  static const DesTextColor = 0xff9e9e9e;
  static const DividerColor = 0xffd9d9d9;
  static const NotifyDotBg = 0xffff3e3e;
  static const NotifyDotText = 0xffffffff;
  static const ConversationMuteIcon = 0xffd8d8d8;
  static const DeviceInfoItemBg = 0xfff5f5f5;
  static const DeviceInfoItemText = 0xff606062;
  static const DeviceInfoItemIcon = 0xff606062;
  static const ContactGroupTitleBg = 0xffebebeb;
  static const contactGroupTitleText = 0xff888888;
  static const IndexLetterBoxBg = Colors.black45;
  static const BackgroundColor = 0xffededed;
  static const NewTagBg = 0xfffa5251;
  static const ButtonDesText = 0xff8c8c8c;
  static const ButtonArrowColor = 0xffadadad;
  static const HeaderCardTitleText = 0xff353535;
  static const HeaderCardBg = Colors.white;
  static const HeaderCardDesText = 0xff7f7f7f;
}

class AppStyles {
  static const TitleStyle = TextStyle(
    fontSize: 14.0,
    color: Color(AppColors.TitleTextColor)
  );

  static const DesStyle = TextStyle(
      fontSize: 12.0,
      color: Color(AppColors.DesTextColor)
  );

  static const UnreadMsgCountDotStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColors.NotifyDotText)
  );

  static const DeviceInfoTextStyle = TextStyle(
    fontSize: 13.0,
    color: Color(AppColors.DeviceInfoItemText)
  );

  static const GroupTitleItemTextStyle = TextStyle(
    fontSize: 14.0,
    color: Color(AppColors.contactGroupTitleText)
  );

  static const IndexLetterBoxTextStyle = TextStyle(
    fontSize: 64.0,
    color: Colors.white
  );

  static const ButtonDesTextStyle = TextStyle(
      fontSize: 12.0,
      color: Color(AppColors.ButtonDesText),
      fontWeight: FontWeight.bold
  );
  static const NewTagTextStyle = TextStyle(
      fontSize: Constants.DesTextSize,
      color: Colors.white,
      fontWeight: FontWeight.bold
  );

  static const HeaderCardTitleTextStyle = TextStyle(
      fontSize: 20.0,
      color: Color(AppColors.HeaderCardTitleText),
      fontWeight: FontWeight.bold
  );

  static const HeaderCardDesTextStyle = TextStyle(
      fontSize: 14.0,
      color: Color(AppColors.HeaderCardDesText),
      fontWeight: FontWeight.normal
  );

}

class Constants {
  static const IconFontFamily = 'appIconFont';
  static const ConversationAvatarSize = 48.0;
  static const DividerWidth = 1.0;
  static const UnReadMsgNotifyDotSize = 20.0;
  static const ConversationMuteIconSize = 18.0;
  static const ContactAvatarSize = 36.0;
  static const IndexBarWidth = 24.0;
  static const IndexLetterBoxSize = 114.0;
  static const IndexLetterBoxRadius = 4.0;
  static const FullWidthIconButtonIconSize = 24.0;
  static const AvatarRadius = 4.0;
  static const DesTextSize = 13.0;
}