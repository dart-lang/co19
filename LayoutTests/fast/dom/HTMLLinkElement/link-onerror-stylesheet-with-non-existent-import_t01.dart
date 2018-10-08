/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that an Error event is fired at an HTML Link 
 * element when its style sheet fails to load an @import'ed style sheet.
 */
import "dart:html";
import "resources/link-load-utilities.dart";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  document.head.append(new Element.html(
    '<link id="lnk" rel="stylesheet" href="$root/resources/stylesheet-with-non-existent-import.css">',
    treeSanitizer: new NullTreeSanitizer()));

  document.body.append(new Element.html(
    '<h1 id="test"><!-- Test element --></h1>',
    treeSanitizer: new NullTreeSanitizer()));
  
  var lnk = document.getElementById('lnk');

  asyncStart();

  lnk.onLoad.listen((_) {
    testFailed('Fired Load event. Should have fired Error event.');
  });

  lnk.onError.listen((_) {
    shouldComputedColorOfElementBeEqualToRGBString(
      document.getElementById("test"),
      "rgb(255, 255, 0)" /* yellow */);
    asyncEnd();
  });
}
