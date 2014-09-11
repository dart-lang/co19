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
      <p>This test checks that programmaticly changing the checked state of
      a checkbox does not fire the "change" event (but user action like
      calling "click" does).</p>
      <div id="console"></div>
              <input type="checkbox" id="myCheckbox">
      ''', treeSanitizer: new NullTreeSanitizer());
	
  var changeEventCount = 0;

  var cb = document.getElementById("myCheckbox");

  cb.onChange.listen((_) => changeEventCount++);

  // This line should not fire a change event
  cb.checked = !cb.checked;

  // This line should fire a change event
  cb.click();

  // This line should not fire a change event
  cb.setAttribute("checked", "checked");

  shouldBe(changeEventCount, 1);
}
