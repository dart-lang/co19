/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This page tests setting onerror handlers through the DOM.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <img style="display:none" id="img1">
      ''', treeSanitizer: new NullTreeSanitizer());

  ImageElement img1 = document.getElementById('img1');
  img1.onError.listen((_) {
    asyncEnd();
  });

  asyncStart();
  img1.src = "IntentionallyMissingFile.jpg";
}
