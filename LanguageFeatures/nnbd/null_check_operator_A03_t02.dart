/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression of the form e! evaluates e to a value v, throws a
 * runtime error if v is null, and otherwise evaluates to v.
 *
 * @description Check that an expression of the form e! evaluates e to a value
 * v, throws no runtime error if v is not null. Test 'this!()' and 'this()!'
 * @author sgrekhov@unipro.ru
 * @static-warning
 * @issue 39723
 * @issue 39598
 */
// SharedOptions=--enable-experiment=non-nullable,extension-methods
// Requirements=nnbd-strong

import "../../Utils/expect.dart";
class C {}

extension on C {
  test() {
    Expect.equals("Lily was here: 42", this!(42));  /// static type warning
    Expect.equals("Lily was here: 42", this(42)!);  /// static type warning
  }
  String call(int v) => "Lily was here: $v";
}

main() {
  C c = new C();
  c.test();
}