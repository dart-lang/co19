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

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var style = new Element.html('''
      <style type="text/css">
          div[attr="caseSensitiveAttr"] {color: green;}
          div[attr="caseSensitiveATTR"] {color: blue;}
          div[dir="ltr"] {color: red};
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="attr1" attr="caseSensitiveAttr">
          This line should be green (attribute value is case sensitive).
      </div>
      <div id="attr2" attr="caseSensitiveATTR">
          This line should be purple (attribute value is case sensitive).
      </div>
      <div id="attr3" attr="casesensitiveattr">
          This line should be black (attribute value is case sensitive).
      </div>
      <div id="dir1" dir="LTR">
          This line should be green (dir attribute is case insensitive).
      <div id="dir2" dir="ltr">
          This line should be green (dir attribute is case insensitive).
      ''', treeSanitizer: new NullTreeSanitizer());

  var attr1 = document.getElementById("attr1");
  var attr2 = document.getElementById("attr2");
  var attr3 = document.getElementById("attr3");
  var dir1 = document.getElementById("dir1");
  var dir2 = document.getElementById("dir2");

  // green
  shouldBeEqualToString(getComputedStyle(attr1).color, "rgb(0, 128, 0)");

  // blue
  shouldBeEqualToString(getComputedStyle(attr2).color, "rgb(0, 0, 255)");

  // black
  shouldBeEqualToString(getComputedStyle(attr3).color, "rgb(0, 0, 0)");

  // red
  shouldBeEqualToString(getComputedStyle(dir1).color, "rgb(255, 0, 0)");

  // red
  shouldBeEqualToString(getComputedStyle(dir2).color, "rgb(255, 0, 0)");
}
