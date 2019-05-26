import 'package:flutter/material.dart';

final List<PageViewModel> pages = [
  PageViewModel(
    const Color(0xFF678FB4),
    'http://imgoss.bfrontend.com/2019-05-26-022400.jpg',
    'first',
    'this is the first page',
    'assets/images/ic_file_transfer.png'
  ),
  PageViewModel(
    const Color(0xFF65B0B4),
    'http://imgoss.bfrontend.com/2019-05-26-022400.jpg',
    'second',
    'this is the second page',
    'assets/images/ic_fengchao.png'
  ),
  PageViewModel(
    const Color(0xFF9B90BC),
    'http://imgoss.bfrontend.com/2019-05-26-022400.jpg',
    'third',
    'this is the third page',
    'assets/images/ic_tx_news.png'
  )
];

class PageViewModel{
  final Color color;
  final String heroAssetPath;
  final String title;
  final String body;
  final String iconAssetPath;

  PageViewModel(
    this.color,
    this.heroAssetPath,
    this.title,
    this.body,
    this.iconAssetPath
  );
}

class Page extends StatelessWidget {

  final PageViewModel viewModel;
  final double percentVisible;

  Page({
    this.viewModel,
    this.percentVisible
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: viewModel.color,
      child: Opacity(
        opacity: percentVisible,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(viewModel.heroAssetPath),
              fit: BoxFit.cover
            )
          ),
        )
      ),
    );
  }
}