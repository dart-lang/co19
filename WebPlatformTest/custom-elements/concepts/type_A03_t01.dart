/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/*
 * Portions of this test are derived from code under the following license:
 *
 * Web-platform-tests are covered by the dual-licensing approach described in:
 * http://www.w3.org/Consortium/Legal/2008/04-testsuite-copyright.html
 */
/**
 * @assertion The custom element type must not be one of hyphen-containing
 * element names.
 */

import 'dart:html';
import "../../../Utils/expect.dart";

class Foo extends HtmlElement {
  Foo.created() : super.created();
}

void testName(name) {
  Expect.throws(() {
    document.register(name, Foo);
  }, null,
      'Exception expected when register custom element with reserved name $name');
}

main() {
  testName('annotation-xml');
  testName('color-profile');
  testName('font-face');
  testName('font-face-src');
  testName('font-face-uri');
  testName('font-face-format');
  testName('font-face-name');
  testName('missing-glyph');
}
