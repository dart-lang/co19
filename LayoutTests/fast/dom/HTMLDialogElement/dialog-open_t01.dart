/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that dialog is visible after show() is called and not
 * visible after close() is called. bug 90931
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <dialog id="mydialog">It's my dialog.</dialog>
    ''', treeSanitizer: new NullTreeSanitizer());

  DialogElement dialog = document.getElementById('mydialog');
  var computedStyle = dialog.getComputedStyle();
  shouldBe(computedStyle.getPropertyValue('display'), 'none');

  dialog.show();
  computedStyle = dialog.getComputedStyle();
  shouldBe(computedStyle.getPropertyValue('display'), 'block');

  dialog.close('');
  computedStyle = dialog.getComputedStyle();

  shouldBe(computedStyle.getPropertyValue('display'), 'none');

  shouldThrow(() {
    dialog.close('');
  }, (e) => e is DomException && e.name == DomException.INVALID_STATE);
}
