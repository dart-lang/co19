/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
<form>
<input name="radios" type="radio">
<input name="radios" type="radio">
</form>''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(document.body.childNodes.length, 1);
  shouldBe(document.getElementsByClassName("class").length, 0);
  shouldBe(document.getElementsByName("radios").length, 2);
  //document.getElementsByTagName("body");
  //document.querySelector("form").elements["radios"];
  shouldBe(document.querySelector("input").labels.length, 0);
}
