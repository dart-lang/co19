/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that adding a child node with only whitespace to 
 * an object tag does not create a new subframe, causing an assert.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div></div>
    <div id="result">FAIL</div>
    <object id="a" data="IntentionallyMissingFile"/></object>
    ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  document.getElementById('a').text = ' ';
  setTimeout(() {
    document.getElementById('result').innerHtml = "PASS";
    asyncEnd();
  }, 10);
}
