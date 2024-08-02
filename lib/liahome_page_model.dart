// lib/liahome_page_model.dart

import 'package:flutter/material.dart';

class LIAhomePAGEModel {
  PageController? pageViewController;
  FocusNode unfocusNode = FocusNode();

  void dispose() {
    pageViewController?.dispose();
    unfocusNode.dispose();
  }
}

LIAhomePAGEModel createModel(BuildContext context, LIAhomePAGEModel Function() modelCreator) {
  return modelCreator();
}
