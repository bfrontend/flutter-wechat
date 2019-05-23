import 'package:flutter/material.dart';

class Profile {
  final String name;
  final String avatar;
  final String account;

  const Profile({
    @required this.name,
    @required this.avatar,
    @required this.account,
  });
}

const Profile me = Profile(
    name: '罗大佑',
    avatar: 'http://img3.doubanio.com/view/thing_review/l/public/p1531476.jpg',
    account: 'a_test_account');