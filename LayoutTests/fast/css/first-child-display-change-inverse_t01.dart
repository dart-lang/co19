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

main() {
  var style = new Element.html('''
      <style>
      .display-when-first-child { display: none; }
      .display-when-first-child:first-child { display: block; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div class="display-when-first-child">FAIL</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var test = document.createElement('div');
  document.body.insertBefore(test, document.body.firstChild);
  if (document.body.text.indexOf('FAIL') < 0)
    test.text = 'PASS';
}
