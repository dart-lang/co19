/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <link href="$root/resources/small.css" rel="stylesheet">
      <link href="$root/resources/small.css" rel="stylesheet">
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    document.body.innerHtml = "This test passes if it doesn't crash.";
    asyncEnd();
  });
}

