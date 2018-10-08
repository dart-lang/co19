/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests that changing an input element's type or speech
 * attribute does not cause focusout event.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <input id="input" type='date' />
      ''', treeSanitizer: new NullTreeSanitizer());

  bool focusoutCalled = false;
  InputElement input = document.getElementById('input') as InputElement;

  input.addEventListener('focusout', (_) {
    focusoutCalled = true;
  });
  input.focus();
  input.setAttribute('x-webkit-speech', '');
  shouldBeFalse(focusoutCalled);
  input.type = 'month';
  shouldBeFalse(focusoutCalled);
  input.type = 'week';
  shouldBeFalse(focusoutCalled);
  input.type = 'time';
  shouldBeFalse(focusoutCalled);
  input.type = 'datetime-local';
  shouldBeFalse(focusoutCalled);
  input.type = 'text';
  shouldBeFalse(focusoutCalled);
}
