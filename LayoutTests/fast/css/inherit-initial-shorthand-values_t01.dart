/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test that e matched declaration cache handles explicitly
 * inherited properties correctly.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style0 = new Element.html('''
    <style>
    #test {
    }
    </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style0);

  var shorthandNames = [
    "background",
    "background-position",
    "background-repeat",
    "border",
    "border-bottom",
    "border-color",
    // getPropertyValue() functionality not supported, see http://webkit.org/b/103245.
    // "border-image",
    "border-left",
    "border-radius",
    "border-right",
    "border-spacing",
    "border-style",
    "border-top",
    "border-width",
    "list-style",
    "font",
    "margin",
    "outline",
    "overflow",
    "padding",
    "webkit-animation",
    "webkit-border-after",
    "webkit-border-before",
    "webkit-border-end",
    "webkit-border-start",
    "webkit-columns",
    "webkit-column-rule",
    "webkit-flex-flow",
    "webkit-flex",
    "webkit-marginCollapse",
    "webkit-marquee",
    "webkit-mask",
    "webkit-mask-position",
    "webkit-mask-repeat",
    "webkit-text-emphasis",
    "webkit-text-stroke",
    "webkit-transition",
    "webkit-transform-origin"
  ];

  var style = style0.sheet.rules[0].style;

  test(shorthand) {
    var result = [];
    /*style[shorthand] = "inherit";
    result.push(style[shorthand]);
    style[shorthand] = "initial";
    result.push(style[shorthand]);*/

    style.setProperty(shorthand, "inherit");
    result.add(style.getPropertyValue(shorthand));
    style.setProperty(shorthand, "initial");
    result.add(style.getPropertyValue(shorthand));
    return result.join(", ");
  }

  for (var i = 0; i < shorthandNames.length; ++i) {
    shouldBeEqualToString(test(shorthandNames[i]), "inherit, initial");
  }
}
