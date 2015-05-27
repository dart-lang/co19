/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that inert nodes cannot be selected. The test passes if 
 * the only text you can select is inside the dialog.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    Here is a text node you can't select.
    <dialog>I'm selectable.</dialog>
    ''', treeSanitizer: new NullTreeSanitizer());

  var dialog = document.querySelector('dialog');
  dialog.showModal();
  document.execCommand('SelectAll', false, '');
  shouldBeEqualToString(window.getSelection().toString(), "I'm selectable.");
}
