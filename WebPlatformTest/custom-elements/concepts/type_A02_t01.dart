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
 * @assertion The custom element type is a sequence of characters that must
 * match the NCName production and contain a U+002D HYPHEN-MINUS character.
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
      'Exception expected when register custom element with illegal name $name');
}

main() {
  testName('xfoo');
  testName('x_foo');
  testName('x.foo');
  testName('x1foo');
  testName('-xfoo');
  testName('1-foo');
  testName('1x-foo');
  testName('.-foo');
  testName('_foo');
  testName('x-f!oo');
}
