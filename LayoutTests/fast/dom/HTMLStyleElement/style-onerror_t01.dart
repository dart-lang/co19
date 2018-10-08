/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that a Error event is fired at an HTML Style element
 * whose @import style sheet failed to load.
 */
import "dart:html";
import "../../../testcommon.dart";
import "../HTMLLinkElement/resources/link-load-utilities.dart";

main() {
  document.body.setInnerHtml('''
    <h1 id="test"><!-- Test element --></h1>
    ''', treeSanitizer: new NullTreeSanitizer());

  StyleElement style = new Element.html('''
    <style>
    @import "IntentionallyMissingFile.css";
    #test { color: yellow; }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());

  style.onLoad.listen((_) {
    testFailed('Load event fired. Should have fired Error event.');
  });

  style.onError.listen((_) {
    shouldComputedColorOfElementBeEqualToRGBString(
      document.getElementById("test"), "rgb(255, 255, 0)" /* yellow */);
    asyncEnd();
  });
  
  asyncStart();
  document.head.append(style);
}
