/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that a Load event for an HTML Style element comes
 * before the Load event for the window.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var count=0;
  var expectedLoadEventTargets = ["style", "body"];

  EventListener didReceiveLoadEvent(elementName) => (_) {
    var expectedTarget = expectedLoadEventTargets[count++];
    shouldBe(elementName, expectedTarget);
    if (count == 2)
      asyncEnd();
  };
  
  var style = new StyleElement();
  style.onLoad.listen(didReceiveLoadEvent('style'));
  document.head.append(style);

  window.onLoad.listen(didReceiveLoadEvent('body'));

  asyncStart();
}

