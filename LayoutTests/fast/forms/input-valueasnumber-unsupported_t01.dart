/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests for .valueAsNumber with non-supported input types.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  InputElement input = document.createElement('input') as InputElement;
  input.type = 'range';
  document.body.append(input);

  checkValueAsNumber(String type) {
    debug('Check for type=' + type);
    input.type = type;
    // Not allowed to set the value of file to anything except empty string.
    input.value = (type == 'file') ? '' : '0';
    shouldBe(input.valueAsNumber, NaN);
    shouldThrow(() => input.valueAsNumber = 0,
        (e) => e is DomException && e.name == DomException.INVALID_STATE);
  }

  checkValueAsNumber('button');
  checkValueAsNumber('checkbox');
  checkValueAsNumber('color');
  checkValueAsNumber('email');
  checkValueAsNumber('file');
  checkValueAsNumber('hidden');
  checkValueAsNumber('image');
  checkValueAsNumber('khtml_isindex');
  checkValueAsNumber('password');
  checkValueAsNumber('radio');
  checkValueAsNumber('reset');
  checkValueAsNumber('search');
  checkValueAsNumber('submit');
  checkValueAsNumber('tel');
  checkValueAsNumber('text');
  checkValueAsNumber('url');
}
