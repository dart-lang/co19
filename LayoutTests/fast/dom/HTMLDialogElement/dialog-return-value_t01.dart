/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that dialog.returnValue is settable and returns the
 * last value set.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <dialog id="test-dialog"></dialog>
    ''', treeSanitizer: new NullTreeSanitizer());

  var dialog = document.getElementById('test-dialog');
  shouldBe(dialog.returnValue, '');

  dialog.returnValue = 'Setting value directly';
  shouldBe(dialog.returnValue, 'Setting value directly');

  //dialog.returnValue = null;
  //shouldBe(dialog.returnValue, 'null');

  dialog.returnValue = '';
  shouldBe(dialog.returnValue, '');

  dialog.show();
  dialog.close('Return value set from close()');
  shouldBe(dialog.returnValue, 'Return value set from close()');

  dialog.show();
  dialog.close('');
  shouldBe(dialog.returnValue, '');

  //dialog.show();
  //dialog.close(null);
  //shouldBe(dialog.returnValue, 'null');

  dialog.returnValue = 'Should not change because close() is invalid';
  shouldThrow(() {
    dialog.close('blah');
  }, (e) => e is DomException && e.name == DomException.INVALID_STATE);
  shouldBe(dialog.returnValue, 'Should not change because close() is invalid');
}
