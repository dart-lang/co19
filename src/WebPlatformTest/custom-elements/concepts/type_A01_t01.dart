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
import '../testcommon.dart';

class Foo extends HtmlElement {
  Foo.created() : super.created();
}

main() {
  document.register('x-foo', Foo);
  document.register('xx-foo', Foo);
  document.register('x--foo', Foo);
  document.register('_-foo', Foo);
  document.register('x-', Foo);
  document.register('x--', Foo);
  document.register('x-1', Foo);
  document.register('x-_', Foo);
  document.register('_-_', Foo);
  document.register('__-', Foo);
  document.register('_-1', Foo);
  document.register('_-..', Foo);
}
