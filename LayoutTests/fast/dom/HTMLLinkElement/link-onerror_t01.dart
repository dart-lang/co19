/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that an Error event is fired at an HTML Link
 * element when it fails to load a non-existent style sheet. 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.head.append(new Element.html(
    '<link id="lnk" rel="stylesheet" href="IntentionallyMissingFile.css">',
    treeSanitizer: new NullTreeSanitizer()));

  var lnk = document.getElementById('lnk');

  asyncStart();

  lnk.onLoad.listen((_) {
    testFailed('Fired Load event. Should have fired Error event.');
  });

  lnk.onError.listen((_) {
    asyncEnd();
  });
}
