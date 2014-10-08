/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description A test for maxlength attribute of an input element with
 * non-text type
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var input = document.createElement('input');
  input.maxLength = 2;
  input.type = 'number';
  document.body.append(input);
  input.focus();
  document.execCommand('insertText', false, '1234');
  shouldBe(input.value, "1234");

  input.remove();
}
