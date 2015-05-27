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
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <div id=foo></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var div = document.getElementById('foo');
  shouldBe(div.style.minWidth, "");
  shouldBe(div.getComputedStyle().getPropertyValue("min-width"), "0px");

  div.style.minWidth = 'auto';
  div.style.maxWidth = 'auto';
  shouldBe(div.style.minWidth, "");
  shouldBe(div.style.maxWidth, "");
  shouldBe(div.getComputedStyle().minWidth, "0px");

  div.style.minWidth = '0';
  shouldBe(div.style.minWidth, "0px");
  shouldBe(div.getComputedStyle().getPropertyValue("min-width"), "0px");

  shouldBe(div.style.minHeight, "");
  shouldBe(div.getComputedStyle().getPropertyValue("min-height"), "0px");

  div.style.minHeight = 'auto';
  div.style.maxHeight = 'auto';
  shouldBe(div.style.minHeight, "");
  shouldBe(div.style.maxHeight, "");
  shouldBe(div.getComputedStyle().minHeight, "0px");

  div.style.minHeight = '0';
  shouldBe(div.style.minHeight, "0px");
  shouldBe(div.getComputedStyle().getPropertyValue("min-height"), "0px");
}
