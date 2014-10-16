/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for https://bugs.webkit.org/show_bug.cgi?id=21903
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var input = document.createElement("input");

  shouldBeEqualToString(input.placeholder, '');

  input.setAttribute("placeholder", "p1");
  shouldBeEqualToString(input.placeholder, 'p1');

  input.placeholder = 'p2';
  shouldBeEqualToString(input.getAttribute('placeholder'), 'p2');
  shouldBeEqualToString(input.placeholder, 'p2');
}
