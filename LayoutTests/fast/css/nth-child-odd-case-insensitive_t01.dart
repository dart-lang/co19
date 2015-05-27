/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description CSS Test: :nth-child selector 'odd' keyword case sensitivity
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style type="text/css">
          div div:nth-child(OdD)
          {
              color: green;
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>The test passes if the odd numbered DIVs are green.</p>
      <div id="test">
          <div>DIV1</div>
          <div>DIV2</div>
      </div>
      <div id="testresult" style="color: blue">Running</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var greenValues = ["green", "#008000", "rgb(0, 128, 0)"];

  var elem = document.getElementById("test");
  var val = getComputedStyle(elem.children[0], null).getPropertyValue("color");

  shouldBeTrue(greenValues.contains(val));
}
