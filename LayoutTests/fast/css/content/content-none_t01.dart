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
  var style = new Element.html('''
      <style type="text/css">
          span:before { content: "TEST FAILED"; }
          #test:before { content: none; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      The texts between the markers should be identical.
      <p>========Marker1========</p>
      <table>
          <tr>
              <td id="testContainer"><span id="test">12345678901234567890</span></td>
              <td>1 1 1 1 1 1 1 1 1 1 1  1 1 11  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 11 1 </td>
          </tr>
      </table>
      <p>========Marker2========</p>
      <table>
          <tr>
              <td id="reference">12345678901234567890</td>
              <td>1 1 1 1 1 1 1 1 1 1 1  1 1 11  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 11 1 </td>
          </tr>
      </table>
      <p>========Marker3========</p>
      <pre id="console"/>
      ''', treeSanitizer: new NullTreeSanitizer());

  run() {
    var testWidth = getComputedStyle(document.getElementById("testContainer"), null).getPropertyValue("width");
    var referenceWidth = getComputedStyle(document.getElementById("reference"), null).getPropertyValue("width");
    shouldBe(testWidth, referenceWidth);
    asyncEnd();
  }

  asyncStart();
  setTimeout(run, 0);
}
