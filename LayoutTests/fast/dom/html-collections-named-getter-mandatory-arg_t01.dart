/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests verifies that HTMLCollection.namedItem() argument is
 * mandatory
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <a id="testLink"></a>
    <div>PASS</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var testLink = document.getElementById("testLink");
  dynamic htmlCollection = document.getElementsByTagName("a");
  shouldBe(htmlCollection.length, 1);
  shouldBe(htmlCollection.namedItem('testLink'), testLink);
  shouldThrow(() => htmlCollection.namedItem());
}
