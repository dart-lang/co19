/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that a Load event is fired at an HTML Link element
 * once it loads a style sheet.
 */
import "dart:html";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  document.head.append(new Element.html(
    '<link id="lnk" rel="stylesheet" href="$root/resources/stylesheet.css">',
    treeSanitizer: new NullTreeSanitizer()));

  var lnk = document.getElementById('lnk');

  asyncStart();

  lnk.onLoad.listen((_) {
    asyncEnd();
  });

  lnk.onError.listen((_) {
    testFailed('Fired Error event. Should have fired Load event.');
  });
}
