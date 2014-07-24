/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description https://bugs.webkit.org/show_bug.cgi?id=111018
 * Bug 111018: getPropertyValue for -webkit-text-stroke returns null, should
 * compute the shorthand value
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
        .test {
          width: 5em;
          height: 10em;
        }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="text-stroke1" class="test" style="-webkit-text-stroke: thin red;"></div>
      <div id="text-stroke2" class="test" style="-webkit-text-stroke: green;"></div>
      <div id="text-stroke3" class="test" style="-webkit-text-stroke: thin;"></div>
      <div id="text-stroke4" class="test" style="-webkit-text-stroke: 1px red;"></div>
      <div id="text-stroke5" class="test" style="-webkit-text-stroke-width: 1px; -webkit-text-stroke-color: black;"></div>
      <div id="text-stroke6" class="test" style="-webkit-text-stroke: foo;"></div>
      <div id="text-stroke7" class="test" style="-webkit-text-stroke-color: green;"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  webkitTextStrokeValue(id) {
    var element = document.getElementById(id);
    return element.style.getPropertyValue("-webkit-text-stroke");
  }

  shouldBeEqualToString(webkitTextStrokeValue("text-stroke1"), 'thin red');
  shouldBeEqualToString(webkitTextStrokeValue("text-stroke2"), 'green');
  shouldBeEqualToString(webkitTextStrokeValue("text-stroke3"), 'thin');
  shouldBeEqualToString(webkitTextStrokeValue("text-stroke4"), '1px red');
  shouldBeEqualToString(webkitTextStrokeValue("text-stroke5"), '1px black');
  debug("NOTE: 'foo' is an illegal CSS value for '-webkit-text-stroke'.");
  //shouldBe(webkitTextStrokeValue("text-stroke6"), null);
  shouldBe(webkitTextStrokeValue("text-stroke6"), '');
  debug("NOTE: If only few longhand properties are specified, getPropertyValue for shorthand property returns null.");
  //shouldBe(webkitTextStrokeValue("text-stroke7"), null);
  shouldBe(webkitTextStrokeValue("text-stroke7"), '');
}
