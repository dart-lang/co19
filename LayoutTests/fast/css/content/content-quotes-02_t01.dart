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
          body { quotes: "WW" "WWWW" "WWW" "WWWWW"; }
          span:before { content: no-open-quote; }
          span:after { content: no-close-quote; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p id="onlyInBrowser">The texts between the markers should be identical.</p>
      <p>========Marker1========</p>
      <table>
          <tr>
              <td id="testContainer"><span>a<q>b</q>c</span><q>d</q></td>
              <td>1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1</td>
          </tr>
      </table>
      <p>========Marker2========</p>
      <table>
          <tr>
              <td id="reference">aWWWbWWWWWcWWdWWWW</td>
              <td>1 1 1 1 1 1 1 1 1 1 1  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1</td>
          </tr>
      </table>
      <p>========Marker3========</p>
      <pre id="console"/>
      ''', treeSanitizer: new NullTreeSanitizer());

  run() {
    document.getElementById("onlyInBrowser").setAttribute("style", "display: none;");
    var testWidth = getComputedStyle(document.getElementById("testContainer"), null).getPropertyValue("width");
    var referenceWidth = getComputedStyle(document.getElementById("reference"), null).getPropertyValue("width");
    shouldBe(testWidth, referenceWidth);
    document.getElementById("onlyInBrowser").setAttribute("style", "display: none;");
    asyncEnd();
  }

  asyncStart();
  setTimeout(run, 0);
}
