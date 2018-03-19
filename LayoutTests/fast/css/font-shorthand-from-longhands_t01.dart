/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test the return values for the font properties on the style object.
 */
import "dart:html";
import "../../testcommon.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var st = new Element.html('''
      <style>
      @font-face {
          font-family: "foobar";
          src: local("foobar");
      }
      div {
          font-family: "foobar";
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(st);

  var testContainer = document.createElement("div");
  document.body.append(testContainer);

  testContainer.appendHtml('<div id="test"><span>hello</div>',
      treeSanitizer: new NullTreeSanitizer());

  var e = document.getElementById('test');
  var style = e.style;
  var computedStyle = getComputedStyle(e);

  // This function checks the return value of style.font and verifies WebKit can parse it.
  checkFontStyleValue() {
    var before = e.style.getPropertyValue('font');
    e.style.font = '';
    e.style.font = before;
    return (e.style.getPropertyValue('font') == before);
  }

  style.fontSize = "20px";
  // We need at least the font-family to build the shorthand.
  shouldBe(style.font, '');
  shouldBe(computedStyle.fontSize, '20px');
  shouldBe(checkFontStyleValue(), true);

  style.fontSize = "20px";
  style.fontFamily = "sans-serif";
  shouldBe(computedStyle.fontFamily, 'sans-serif');
  shouldBe(checkFontStyleValue(), true);

  style.fontStyle = "italic";
  shouldBe(computedStyle.fontStyle, 'italic');
  shouldBe(checkFontStyleValue(), true);

  style.fontVariant = "small-caps";
  shouldBe(computedStyle.fontVariant, 'small-caps');
  shouldBe(checkFontStyleValue(), true);

  style.fontWeight = "bold";
  shouldBe(computedStyle.fontWeight, '700');
  shouldBe(checkFontStyleValue(), true);

  style.lineHeight = "40px";
  shouldBe(computedStyle.lineHeight, '40px');
  shouldBe(checkFontStyleValue(), true);

  style.font = "";
  shouldBe(style.font, '');
  shouldBe(checkFontStyleValue(), true);

  style.fontWeight = "600";
  // It is normal to return null as the font-size is mandatory to build the shorthand.
  shouldBe(computedStyle.fontWeight, '600');
  shouldBe(checkFontStyleValue(), true);

  style.fontSize = "40px";
  style.fontFamily = "sans-serif";
  style.fontWeight = "bold";
  shouldBe(computedStyle.fontSize, '40px');
  shouldBe(computedStyle.fontFamily, 'sans-serif');
  shouldBe(checkFontStyleValue(), true);

  testContainer.remove();
}
