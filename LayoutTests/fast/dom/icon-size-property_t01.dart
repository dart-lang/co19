/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests for sizes attribute of the link element.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <link id="rel-icon" rel="icon" sizes="23x47 19x42" type="image/x-icon" href="http://test.com/oldfavicon.ico"/>
    <link id="no-sizes" rel="icon" type="image/x-icon" href="http://test.com/oldfavicon.ico"/>
    <link id="empty-sizes" rel="icon" sizes="" type="image/x-icon" href="http://test.com/oldfavicon.ico"/>
    ''', treeSanitizer: new NullTreeSanitizer());

  LinkElement icon = document.getElementById("rel-icon");

  shouldEvaluateTo(icon.sizes.length, 2);
  shouldBeEqualToString(icon.sizes.value, "23x47 19x42");

  // no setter sizes= in dart
  /*icon.sizes = "10x10 20x20 30x30";
  shouldEvaluateTo(icon.sizes.length, 3);
  shouldBeEqualToString(icon.sizes.value, "10x10 20x20 30x30");*/

  icon = document.getElementById("no-sizes");
  shouldEvaluateTo(icon.sizes.length, 0);
  shouldBeEqualToString(icon.sizes.value, "");

  icon = document.getElementById("empty-sizes");
  shouldEvaluateTo(icon.sizes.length, 0);
  shouldBeEqualToString(icon.sizes.value, "");
}
