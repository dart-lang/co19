/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This page tests setting 'selected' and 'text' on an option
 * element.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <form>
          <select id='sel'>
              <option value='bad'>FAIL</option>
              <option value='good'>FAIL</option>
          </select>
      </form>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById('sel').options[1].selected = true;
  //shouldBe(document.getElementById('sel').options.selectedIndex, 1);
  shouldBe(document.getElementById('sel').options[1].selected, true);
  document.getElementById('sel').options[1].text = "PASS";
  shouldBe(document.getElementById('sel').options[1].text, "PASS");
}
