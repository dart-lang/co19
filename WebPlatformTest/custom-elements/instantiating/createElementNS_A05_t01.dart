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
 * @assertion Created callback should be called if createElementNS is called
 */

import 'dart:html';
import "../../../Utils/expect.dart";
import '../testcommon.dart';

var called;

class Foo extends HtmlElement {
  static const tag = 'x-foo';
  factory Foo() => document.createElementNS(HTML_NAMESPACE, tag);
  factory Foo.ext(t) => document.createElementNS(HTML_NAMESPACE, t, tag);
  Foo.created() : super.created() {
    called = true;
  }
}

main() {
  called = false;
  var x = new Foo();
  Expect.isFalse(called);
  
  document.register(Foo.tag, Foo);
  x = new Foo();
  Expect.isTrue(called);
  
  called = false;
  x = new Foo.ext(Foo.tag);
  Expect.isTrue(called);
}
