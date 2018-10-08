/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id="theDiv" style="display:none;"></div>
      <div>This tests that getComputedStyle does a relayout before returning the computed style.</div>
      <div id="result">FAIL</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  runTest() {
    var d = document.getElementById('theDiv');
    d.style.display = 'block';
    var style = getComputedStyle(d, '');

    if (style != null && style.display == 'block')
      document.getElementById('result').innerHtml = 'PASS';
  }

  runTest();
}
