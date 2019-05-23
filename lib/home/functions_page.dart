import 'package:flutter/material.dart';

import '../i18n//strings.dart' show Strings;

import '../model/me.dart' show me;
import '../constants.dart' show AppColors, AppStyles;
import './full_width_button.dart';

class _Header extends StatelessWidget {
  static const AVATAR_SIZE = 64.0;
  static const RADIUS = 6.0;
  static const SEPARATOR_SIZE = 16.0;
  static const QR_CODE_PREV_SIZE = 20.0;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      color: AppColors.HeaderCardBg,
      padding: const EdgeInsets.symmetric(
          horizontal: FullWidthButton.HORIZONTAL_PADDING,
          vertical: FullWidthButton.VERTICAL_PADDING,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(RADIUS),
            child: Image.network(
              me.avatar,
              width: AVATAR_SIZE,
              height: AVATAR_SIZE,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding:
                  const EdgeInsets.only(left: SEPARATOR_SIZE, bottom: 5.0),
                  child:
                  Text(me.name, style: AppStyles.HeaderCardTitleTextStyle),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: SEPARATOR_SIZE),
                          child: Text('${Strings.WechatAccountIs}${me.account}',
                              style: AppStyles.HeaderCardDesTextStyle),
                        )),
                    Image.asset(
                      'assets/images/ic_qrcode_preview_tiny.png',
                      width: QR_CODE_PREV_SIZE,
                      height: QR_CODE_PREV_SIZE,
                    ),
                    FullWidthButton.arrowRight(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FunctionsPage extends StatefulWidget {
  @override
  _FunctionsPageState createState() => _FunctionsPageState();
}

class _FunctionsPageState extends State<FunctionsPage> {
  static const SEPARATOR_SIZE = 10.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(AppColors.BackgroundColor),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _Header(),
            SizedBox(height: SEPARATOR_SIZE),
            FullWidthButton(
              iconPath: 'assets/images/ic_wallet.png',
              title: Strings.Payments,
              onPressed: () {
                print('点击的是钱包按钮。');
              },
            ),
            SizedBox(height: SEPARATOR_SIZE),
            FullWidthButton(
              iconPath: 'assets/images/ic_collections.png',
              title: Strings.Collections,
              showDivider: true,
              onPressed: () {
                print('点击的是收藏按钮。');
              },
            ),
            FullWidthButton(
              iconPath: 'assets/images/ic_album.png',
              title: Strings.Album,
              showDivider: true,
              onPressed: () {
                print('点击的是相册按钮。');
              },
            ),
            FullWidthButton(
              iconPath: 'assets/images/ic_cards_wallet.png',
              title: Strings.Wallet,
              showDivider: true,
              onPressed: () {
                print('打开卡包应用');
              },
            ),
            FullWidthButton(
              iconPath: 'assets/images/ic_emotions.png',
              title: Strings.Emotions,
              onPressed: () {
                print('打开表情应用');
              },
            ),
            SizedBox(height: SEPARATOR_SIZE),
            FullWidthButton(
              iconPath: 'assets/images/ic_settings.png',
              title: Strings.Settings,
              des: Strings.AccountNotProtected,
              showRightArrow: false,
              onPressed: () {
                print('打开设置');
              },
            ),
          ],
        ),
      ),
    );
  }
}