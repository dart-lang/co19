/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description CSS Test: generated content complex content for :before
 * pseudo-element.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html(r'''
      <style type="text/css">
          #test { counter-reset:ctr; quotes:"\0022" "\0022" "\0022" "\0022"}

          #test:before {
              content:counter(ctr) url(support/IntentionallyMissingFile.png) open-quote "Before-" attr(class);
              counter-increment:ctr;
          }
          #test:after {
              content:counter(ctr) url(support/IntentionallyMissingFile.png) "After-" attr(class) close-quote;
              counter-increment:ctr;
          }
          .table:before, .table:after { display:table; }
          div { border:1px solid green; margin:5px; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p id="onlyInBrowser">The texts between the markers should be identical.</p>
      <p>========Marker1========</p>
      <table>
          <tr>
              <td id="testContainer"><div id="test" class="table">Inner</div></td>
              <td>1 1 1 1</td>
          </tr>
      </table>
      <p>========Marker2========</p>
      <table>
          <tr>
              <td id="reference"><div><span style="display: table;">1<img
              src="support/IntentionallyMissingFile.png"/>"Before-table</span>Inner<span
              style="display: table">2<img
              src="support/IntentionallyMissingFile.png"/>After-table"</span></div></td>
              <td>1 1 1 1</td>
          </tr>
      </table>
      <p>========Marker3========</p>
      <pre id="console"/>
      </td><td valign="top">
      ''', treeSanitizer: new NullTreeSanitizer());

  compareProperty(testStyle, referenceStyle, propertyName) {
    var testValue = testStyle.getPropertyValue(propertyName);
    var referenceValue = referenceStyle.getPropertyValue(propertyName);
    shouldBe(testValue, referenceValue);
  }

  run(_) {
    document.getElementById("onlyInBrowser").setAttribute("style", "display: none;");
    var testStyle = getComputedStyle(document.getElementById("testContainer"), null);
    var referenceStyle = getComputedStyle(document.getElementById("reference"), null);
    compareProperty(testStyle, referenceStyle, "width");
    compareProperty(testStyle, referenceStyle, "height");
    asyncEnd();
  }

  asyncStart();
  window.onLoad.listen(run);
}
