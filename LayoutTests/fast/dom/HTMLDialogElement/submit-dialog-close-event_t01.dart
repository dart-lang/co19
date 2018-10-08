/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests submitting a dialog on a close event triggered by a previous submission.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <dialog>
        <form method="dialog">
            <input id="goodbye" type="submit" value="Goodbye">
            <input id="hello" type="submit" value="Hello">
        </form>
    </dialog>
    ''', treeSanitizer: new NullTreeSanitizer());

  testHello()
  {
    DialogElement dialog = document.querySelector('dialog');
    dialog.show();
    dialog.addEventListener('close', (_) {
      shouldBeFalse(dialog.open);
      shouldBeEqualToString(dialog.returnValue, 'Hello');
      asyncEnd();
    });
    document.querySelector('#hello').click();
  }

  testGoodbye()
  {
    DialogElement dialog = document.querySelector('dialog');
    dialog.show();
    listener (_) {
      dialog.removeEventListener('close', listener);
      shouldBeFalse(dialog.open);
      shouldBeEqualToString(dialog.returnValue, 'Goodbye');
      testHello();
    }
    dialog.addEventListener('close', listener);
    document.querySelector('#goodbye').click();
  }

  asyncStart();
  testGoodbye();
}
