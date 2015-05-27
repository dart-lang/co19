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
      <select id="select">
          <option>FAIL</option>
          <option>PASS</option>
          <option selected="true">Did not run</option>
      </select>
      ''', treeSanitizer: new NullTreeSanitizer());

  var select = document.getElementById('select');
  select.selectedIndex = 1;
  shouldBe(select.selectedIndex, 1);
}
