import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../core/models/post/post.dart';


class PostsViewModel extends BaseViewModel {
  BuildContext? context;
  Post? post;
  Post? item;

  Future<void> init(BuildContext context, Post post) async {
    this.context = context;

    setBusy(true);

    this.post = post;


    setBusy(false);
  }
}
