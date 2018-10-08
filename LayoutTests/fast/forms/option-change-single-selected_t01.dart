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
      <p>Test for <a href="http://bugs.webkit.org/show_bug.cgi?id=13278">bug 13278</a>: REGRESSION: cannot change SELECT option.</p>
      <form>
      <select size="1">
        <option>FAILURE: script didn't run</option>
        <option>FAILURE</option>
        <option>SUCCESS</option>
      </select>
      <select size="3">
        <option>FAILURE: script didn't run</option>
        <option>FAILURE</option>
        <option>SUCCESS</option>
      </select>
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  SelectElement select0 = document.body.querySelectorAll('select')[0];
  SelectElement select1 = document.body.querySelectorAll('select')[1];

  select0.options[1].selected = true;
  select1.options[1].selected = true;

  select0.options[2].selected = true;
  select1.options[2].selected = true;

  shouldBe(select0.value, "SUCCESS");
  shouldBeFalse(select1.options[1].selected);
}
