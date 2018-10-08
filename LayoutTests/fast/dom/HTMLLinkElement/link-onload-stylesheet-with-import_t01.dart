/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that a Load event is fired at an HTML Link element 
 * once all @import'ed stylesheets are loaded by a style sheet.
 */
import "dart:html";
import "resources/link-load-utilities.dart";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  document.head.append(new Element.html(
    '<link id="lnk" rel="stylesheet" href="$root/resources/stylesheet-with-import.css">',
    treeSanitizer: new NullTreeSanitizer()));

  document.body.append(new Element.html(
    '<h1 id="test"><!-- Test element --></h1>',
    treeSanitizer: new NullTreeSanitizer()));
  
  var lnk = document.getElementById('lnk');

  asyncStart();

  lnk.onLoad.listen((_) {
    shouldComputedColorOfElementBeEqualToRGBString(
      document.getElementById("test"),
      "rgb(0, 0, 255)" /* blue */);
    asyncEnd();
  });

  lnk.onError.listen((_) {
    testFailed('Fired Error event. Should have fired Load event.');
  });
}
