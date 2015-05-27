/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that the onchange event can be set on any element with an
 * attribute.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <div>
        <form>
            <input type="text" id="e">
        </form>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var count=0;

  document.body.query('input').onChange.listen((_) {
    shouldBe(++count, 1);
  });
  document.body.query('form').onChange.listen((_) {
    shouldBe(++count, 2);
  });
  document.body.query('div').onChange.listen((_) {
    shouldBe(++count, 3);
  });

  document.getElementById('e').focus();
  document.execCommand("InsertText", false, "foo");
  document.getElementById('e').blur();

  shouldBe(count, 3);
}
