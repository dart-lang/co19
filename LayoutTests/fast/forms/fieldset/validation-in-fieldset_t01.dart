/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <fieldset id="f1" disabled>
        <input required id="i1">
      </fieldset>
      <fieldset id="f2">
        <input required id="i2">
      </fieldset>
      ''', treeSanitizer: new NullTreeSanitizer());

  debug('A form control in initially disabled fieldset:');
  InputElement control1 = document.getElementById("i1") as InputElement;
  shouldBeFalse(control1.willValidate);
  debug('Then, enables the fieldset:');
  FieldSetElement fieldset1 = document.getElementById("f1");
  fieldset1.disabled = false;
  shouldBeTrue(control1.willValidate);

  debug('A form control in initially enabled fieldset:');
  InputElement control2 = document.getElementById("i2") as InputElement;
  FieldSetElement fieldset2 = document.getElementById("f2");
  shouldBeTrue(control2.willValidate);
  debug('Then, disables fieldset:');
  fieldset2.disabled = true;
  shouldBeFalse(control2.willValidate);
  debug('Detach the form control from the fieldset:');
  control2.remove();
  shouldBeTrue(control2.willValidate);
}
