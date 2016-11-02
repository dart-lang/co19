/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that the correct form control element is activated
 * when clicking on a label.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <Label id="label1">label1<input id="cb1" type="checkbox"></label><br>
    <Label id="label2">label2<fieldset><legend><input id="cb2" type="checkbox"></legend></fieldset></label><br>
    ''', treeSanitizer: new NullTreeSanitizer());

  var label1 = document.getElementById('label1');
  label1.focus();
  debug('test1');
  shouldBe(document.getElementById('cb1'), document.activeElement);

  debug('test2');
  var label2 = document.getElementById('label2');
  label2.focus();
  shouldBe(document.getElementById('cb2'), document.activeElement);
}

