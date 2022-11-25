// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A postfix expression of the form e1[e2]--, is equivalent to
/// (a, i){var r = a[i]; a[i] = r - 1; return r}(e1, e2 ).
/// @description Checks that a postfix expression of the form e1[e2]--, is
/// equivalent to (a, i){var r = a[i]; a[i] = r - 1; return r}(e1, e2) in effect.
/// @author kaigorodov

import '../../../Utils/expect.dart';

class C {
  var v;
  C(this.v);
}

void test(var n) {
  List e1 = [new C(n)];
  var r = e1[0].v--;
  Expect.equals(r, n);
  Expect.equals(e1[0].v, (n - 1));
}

main() {
  test(0);
  test(-1);
  test(1);
  test(1000000);
  test(-1000000);
}
