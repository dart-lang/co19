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
      <fieldset disabled>
        <input id=input1>
      </fieldset>
      ''', treeSanitizer: new NullTreeSanitizer());

  InputElement input1 = document.getElementById('input1') as InputElement;
  debug('A form control in a disabled fieldset is not focusable:');
  input1.focus();
  shouldBe(document.activeElement, document.body);

  debug('It becomes focusable if the fieldset is enabled:');
  FieldSetElement fieldset = document.body.querySelector('fieldset');
  fieldset.disabled = false;
  input1.focus();
  shouldBe(document.activeElement, input1);
}
