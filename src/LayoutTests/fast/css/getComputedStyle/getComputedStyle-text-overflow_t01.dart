/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for WebKit bug 27554: getComputedStyle does not contain a
 * value for text-overflow
 */
import "dart:html";
import "../../../testcommon.dart";
import "../../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
          .test {
              background-color: #ccc;
              border: 1px solid #333;
              width: 200px;
              height: 100px;
              margin: 10px;
              overflow: hidden;
              white-space: nowrap;
          }
          
          #ellipsis {
              text-overflow: ellipsis;
          }
          
          #clip {
              text-overflow: clip;
          }
          
          .fail {
              color: red;
          }

          .success {
              color: green;
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <h3>Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=27554">WebKit bug 27554</a>: getComputedStyle does not contain a value for text-overflow</h3>
      <br />
      <div id="ellipsis" class="test">This text should overflow the box but should show ellipsis when the text is cut off at the edge of the box because it doesn't fit in the box as is. </div>
      <br />
      <div id="clip" class="test">This text should also overflow the box but should be clipped so that you don't see any ellipsis and the text just seems to end at an awkward place because it doesn't fit in the box. </div>
      <br />
      <div id="default" class="test">This text should also overflow and be clipped because text-overflow should have the default behavior of clipping when no text-overflow is specified. </div>
      <br />
      <div id="results"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  checkComputedTextOverflow(element, name, expected) {
    var resultElement = document.getElementById("results");
    var msg = document.createElement('p');

    var computedTextOverflow = getComputedStyle(element, null).textOverflow;
    if (computedTextOverflow != null && (computedTextOverflow == expected))
      msg.innerHtml = "<span class='success'>PASS</span> Expected text-overflow: " + expected + " for " + name + " and got it.";
    else if (computedTextOverflow == null)
      msg.innerHtml = "<span class='fail'>FAIL</span> Expected text-overflow: " + expected + " for " + name + " but there was no value for text-overflow in the computed style.";
    else
      msg.innerHtml = "<span class='fail'>FAIL</span> Expected text-overflow: " + expected + " for " + name + " but got " + computedTextOverflow + ".";

    resultElement.append(msg);
  }

  runTests() {
    checkComputedTextOverflow(document.getElementById("ellipsis"), "div with text-overflow set to ellipsis", "ellipsis");
    checkComputedTextOverflow(document.getElementById("clip"), "div with text-overflow set to clip", "clip");
    checkComputedTextOverflow(document.getElementById("default"), "div with no text-overflow set", "clip");
  }

  runTests();
}

