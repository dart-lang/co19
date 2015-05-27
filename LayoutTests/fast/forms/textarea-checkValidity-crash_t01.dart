/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Bug 45681: Assertion failure about dirty flag changes of
 * textarea elements.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var ta = document.createElement('textarea');
  ta.setAttribute('maxlength', '1');
  ta.value = 'abc'; // Make it dirty && invalid.
  ta.checkValidity(); // This made an assertion failure.
  testPassed('Not crashed.');

  ta.value = 'a'; // Make it dirty && valid.
  ta.defaultValue = 'abc'; // Make it non-dirty && invalid.
  ta.checkValidity(); // This made an assertion fail.
  testPassed('Not crashed.');
}
