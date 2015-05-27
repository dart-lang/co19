/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Check if the pattern constraint is not applied to some input
 * types.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var input = document.createElement('input');
  input.type = 'range';
  input.pattern = '[0-9]';  // Restrict to single digit
  input.value = '11';

  // pattern doesn't work for type=range
  shouldBe(input.validity.patternMismatch, false);

  // works for type=text.
  input.type = 'text';
  shouldBe(input.validity.patternMismatch, true);
}
