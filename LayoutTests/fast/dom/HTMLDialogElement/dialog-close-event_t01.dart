/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that dialog receives a close event upon closing.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <dialog></dialog>
    ''', treeSanitizer: new NullTreeSanitizer());

  document.addEventListener('close', (event) {
    testFailed("The 'close' event unexpectedly bubbled.");
  });

  var closedCount = 0;
  DialogElement dialog = document.querySelector('dialog');
  dialog.addEventListener('close', (event) {
    closedCount++;
    //var self = this;
    //shouldBe(self, dialog);
    shouldBeFalse(dialog.open);
    shouldBeFalse(event.cancelable);
    event.preventDefault();

    if (closedCount < 2) {
      dialog.show();
      dialog.close('');
    };
  });

  dialog.show();
  dialog.close('');

  // Verify that preventDefault() didn't cancel closing.
  shouldBeFalse(dialog.open);
  shouldBe(closedCount, 2);
}
