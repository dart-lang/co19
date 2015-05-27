/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Clone a checked radio box, the radio box being cloned should
 * still be checked till the clone is inserted into the dom tree.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div>
        <input id="radio" type="radio" name="radiotest" checked="checked" />
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var oldEl = document.getElementById('radio');
  var newEl = oldEl.clone(true);

  debug('test 1');
  shouldBe(oldEl.checked, true);
  shouldBe(newEl.checked, true);

  oldEl.parentNode.append(newEl);

  debug('test 2');
  shouldBe(oldEl.checked, false);
  shouldBe(newEl.checked, true);
}
