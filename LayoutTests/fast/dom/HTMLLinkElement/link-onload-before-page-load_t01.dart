/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that a Load event for an HTML Link element comes 
 * before the Load event for the window.
 */
import "dart:html";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  var expectedLoadEventTargets = ["link", "body"];
  var ind = 0;

  EventListener didReceiveLoadEvent(elementName) => (_) {
    var expectedTarget = expectedLoadEventTargets[ind++];
    shouldBe(elementName, expectedTarget);
    if (ind == 2) {
      asyncEnd();
    }
  };

  window.onLoad.listen(didReceiveLoadEvent('body'));

  document.head.append(new Element.html(
    '<link id="lnk" rel="stylesheet" href="$root/resources/stylesheet.css">',
    treeSanitizer: new NullTreeSanitizer()));

  var lnk = document.getElementById('lnk');

  asyncStart();

  lnk.onLoad.listen(didReceiveLoadEvent('link'));
}
