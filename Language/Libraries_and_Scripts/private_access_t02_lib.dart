/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */

library Libraries_and_Scripts_A05_t02_lib;
import "../../Utils/expect.dart";

var _foo = "foo";

_func() => 1;

class _C {
  var _x = 1;
}

typedef _td(p1, p2);

foo() {
  Expect.equals('foo', _foo);
  Expect.equals(1, _func());
  Expect.equals(1, new _C()._x);
  Expect.isTrue((p1,p2) {} is _td);
}
