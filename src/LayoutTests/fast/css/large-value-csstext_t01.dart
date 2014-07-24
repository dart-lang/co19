/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test should not crash.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
        <style type="text/css" media="screen">
            #box {
                border-top-left-radius:  99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999%;
                border-top-right-radius: 0.000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009%;
            }
        </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>This test should not crash.</p>
      <div id="box"></div>
      <div id="output"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var output = document.getElementById('output');

  var rule = style.sheet.cssRules[0];
  output.innerHtml += rule.style.getPropertyValue('border-top-left-radius') + "<br>";
  output.innerHtml += rule.style.getPropertyValue('border-top-right-radius');
}
