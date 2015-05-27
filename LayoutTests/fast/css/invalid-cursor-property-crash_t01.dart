/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <div id="theDiv" style="cursor: url()">
      <div>This tests that the invalid cursor property value does not get applied. See Bug 11221.</div>
      <div id="result">FAIL</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var d = document.getElementById('theDiv');
  var style = getComputedStyle(d, '');

  if (style != null && style.cursor == 'auto')
    document.getElementById('result').innerHtml = 'PASS';
}
