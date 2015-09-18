/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Each form control in this document exposes a validity attribute
 * that returns a live instance of ValidityState.
 * @static-warning
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  document.body.setInnerHtml('''
      <fieldset name="victim">
      <select name="victim"></select>
      <input name="victim"/>
      <textarea name="victim"></textarea>
      <button name="victim"></button>
      <output name="victim"></output>
      <object name="victim"></object>
      <keygen name="victim"></keygen>
      </fieldset>
      ''', treeSanitizer: new NullTreeSanitizer());

  var controls = document.getElementsByName("victim");
  for (var i = 0; i < controls.length; ++i) {
    debug('===> Tests for ' + controls[i].tagName);
    var validity1, validity2;
    validity1 = controls[i].validity;
    validity2 = controls[i].validity;
    shouldBeTrue(validity1 is ValidityState);
    shouldBe(validity1, validity2);
  }

  shouldThrow(() => new ValidityState());
}
