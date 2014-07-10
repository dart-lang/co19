/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test the style.length of an element with a border-image.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <div id="testElement">test</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  debug("border-image");
  var testElement = document.getElementById('testElement');
  testElement.style.borderImage = "url(dummy://test.png) 10 / 13px 1.5em 1em 10px";
  shouldBe(testElement.style.length, 5);
  testElement.style.borderImage = "initial";
  shouldBe(testElement.style.length, 5);
  testElement.style.borderImage = "inherit";
  shouldBe(testElement.style.length, 5);
  testElement.style.borderImage = "";
  shouldBe(testElement.style.length, 0);

  debug("-webkit-border-image");
  testElement.style.setProperty('-webkit-border-image', "url(dummy://test.png) 0 7 0 13 / 0 7 0 13 stretch stretch");
  shouldBe(testElement.style.length, 1);
  testElement.style.setProperty('-webkit-border-image', "initial");
  shouldBe(testElement.style.length, 1);
  testElement.style.setProperty('-webkit-border-image', "inherit");
  shouldBe(testElement.style.length, 1);
  testElement.style.setProperty('-webkit-border-image', "");
  shouldBe(testElement.style.length, 0);

  // -webkit-mask-box-image behaves exactly like border-image in terms of CSS syntax.
  debug("-webkit-mask-box-image");
  testElement.style.setProperty('-webkit-mask-box-image', "url(dummy://test.png) 0 7 0 13 / 0 7 0 13 stretch stretch");
  shouldBe(testElement.style.length, 5);
  testElement.style.setProperty('-webkit-mask-box-image', "initial");
  shouldBe(testElement.style.length, 5);
  testElement.style.setProperty('-webkit-mask-box-image', "inherit");
  shouldBe(testElement.style.length, 5);
  testElement.style.setProperty('-webkit-mask-box-image', "");
  shouldBe(testElement.style.length, 0);

  testElement.remove();
}
