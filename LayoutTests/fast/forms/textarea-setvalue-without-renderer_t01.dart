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

main() {
  document.body.setInnerHtml('''
<p>This test checks for a regression against <i><rdar://problem/4344760> Glendale REGRESSION (Safari 416.12-417.2) gmail 'reply' does not fill in to: field or quoted message</i>. Specifically, it checks to make sure that a textarea element created without a renderer maintains its value after it gains a renderer.</p>
<p>If the test passes, you will see a value of "success" below.</p>
      ''', treeSanitizer: new NullTreeSanitizer());

  TextAreaElement e = document.createElement("textarea") as TextAreaElement;
  e.value = "success";
  document.getElementsByTagName("body")[0].append(e);
  shouldBe(e.value, "success");
}
