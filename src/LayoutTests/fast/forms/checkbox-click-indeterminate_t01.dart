/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that clicking on indeterminate checkbox flips both
 * checked/indeterminate states and calling preventDefault restores them.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var cb = document.createElement("input");
  document.body.append(cb);
  cb.type = "checkbox";

  debug("Test if clicking on unchecked indeterminate checkbox flips both checked/indeterminate states");
  cb.checked = false;
  cb.indeterminate = true;
  cb.click();
  shouldBeTrue(cb.checked);
  shouldBeFalse(cb.indeterminate);

  debug("Test if clicking on checked indeterminate checkbox flips both checked/indeterminate states");
  cb.checked = true;
  cb.indeterminate = true;
  cb.click();
  shouldBeFalse(cb.checked);
  shouldBeFalse(cb.indeterminate);

  debug("Test if preventDefault restores the checked/indeterminate states");
  cb.checked = false;
  cb.indeterminate = true;
  cb.onClick.listen((e) {
    shouldBeTrue(cb.checked);
    shouldBeFalse(cb.indeterminate);
    e.preventDefault();
  });
  cb.click();
  shouldBeFalse(cb.checked);
  shouldBeTrue(cb.indeterminate);
}
