/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for https://bugs.webkit.org/show_bug.cgi?id=21248
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  TextAreaElement textarea = document.createElement('textarea') as TextAreaElement;

  shouldBeEqualToString(textarea.placeholder, '');

  textarea.setAttribute('placeholder', 'p1');
  shouldBeEqualToString(textarea.placeholder, 'p1');
  shouldBeEqualToString(textarea.value, '');

  textarea.placeholder = 'p2';
  shouldBeEqualToString(textarea.getAttribute("placeholder"), 'p2');
  shouldBeEqualToString(textarea.placeholder, 'p2');
}
