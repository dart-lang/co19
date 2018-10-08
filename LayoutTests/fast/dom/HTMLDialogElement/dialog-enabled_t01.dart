/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description The DIALOG element should be recognized if the dialog feature is on.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <dialog id="mydialog"></dialog>
    ''', treeSanitizer: new NullTreeSanitizer());

  var dialog = document.getElementById('mydialog');
  shouldBeTrue(dialog is DialogElement);
}
