/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Switch between display block and none on :focus
 */
import "dart:html";
import "../../testcommon.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var style = new Element.html('''
      <style>
              .box {
                      width: 100px;
                      height: 100px;
                      background-color: blue;
                      color: white;
                      padding: 10px;
              }
              #button {
                      display: block;
                      width: 200px;
                      height: 50px;
              }
              #button:focus {
                      display: none;
              }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
  
  document.body.setInnerHtml('''
      <button type="button" id="button">When you hit TAB, this button should disappear.</button>
      <div class="box">This is here to show the layout being recomputed</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  release() {
    var button  = document.getElementById("button");
    var displayMode = getComputedStyle(button).getPropertyValue("display");

    if (displayMode == "none")
      testPassed("Setting display to none on focus processed OK.");
    else
      testFailed("Setting display to none on focus FAILED." + " (expected 'none', got '" + displayMode + "')");

    var elementsToHide = document.getElementsByClassName('box');
    for (var element, i = 0; element == elementsToHide[i]; i++)
      element.style.visibility = "hidden";

    asyncEnd();

  }

  beginTest() {
    var button  = document.getElementById("button");
    button.focus();

    release();
  }

  asyncStart();
  beginTest();
}
