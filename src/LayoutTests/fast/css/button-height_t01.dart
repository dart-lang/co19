/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This tests that the specified height is honored (*) for <input>
 * and <button> elements. (*) The Mac ports ignore the specified height for
 * <input type="button"> elements unless a border and/or background CSS
 * property is also specified (see the fifth button below). Disregarding
 * padding, they render the button with a height equal to the height of the
 * font used for the button label.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var style = new Element.html('''
      <style>
      #button3, #button5 { height: 40px; }
      #button4 { height: 40px; background-color: yellow; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p id="description"></p>
      <div id="test-container">
          <ol>
              <li><input id="button1" type="button" value="unspecified height"/><p><strong>Expected height:</strong> height of button label font.</p></li>
              <li><button id="button2">unspecified height</button><p><strong>Expected height:</strong> height of button label font.</p></li>
              <li><button id="button3">height 40 pixels</button><p><strong>Expected height:</strong> 40 pixels.</p></li>
              <li><input id="button4" type="button" value="height 40 pixels, background yellow"/><p><strong>Expected height:</strong> 40 pixels.</p></li>
              <li><input id="button5" type="button" value="height 40 pixels (*)"/><p><strong>(*) Expected height:</strong><br/>Mac: height of button label font.<br/>Other: 40 pixels.</p></li>
          </ol>
      </div>
      <hr/>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(document.getElementById('button1').offsetHeight, document.getElementById('button2').offsetHeight);
  shouldEvaluateTo(document.getElementById('button3').offsetHeight, 40);
  shouldEvaluateTo(document.getElementById('button4').offsetHeight, 40);

  // Note, the expected height is the height of button 1 for the Mac ports, and 40 otherwise.
  var expectedButton5Height = (window.navigator.platform.indexOf("Mac") != -1) ? document.getElementById("button1").offsetHeight : 40;
  if (document.getElementById('button5').offsetHeight == expectedButton5Height)
    testPassed("document.getElementById('button5').offsetHeight is correct for this platform.");
  else
    testFailed("document.getElementById('button5').offsetHeight is incorrect for this platform. Should be the same height as button 1 for the Mac ports and 40 otherwise.");
}
