// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An expression of the form e! evaluates e to a value v, throws a
/// runtime error if v is null, and otherwise evaluates to v.
///
/// @description Check that an expression of the form e! evaluates e to a value
/// v, throws no runtime error if v is not null. Test 'this!()' and 'this()!'
/// @author sgrekhov@unipro.ru
/// @issue 39723
/// @issue 39598

// Requirements=nnbd-strong

import "../../Utils/expect.dart";

class C {
  test() {
    Expect.equals("Lily was here: 42", this!(42));
//                                         ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
//                                     ^
// [cfe] Operand of null-aware operation '!' has type 'C' which excludes null.
    Expect.equals("Lily was here: 42", this(42)!);
//                                             ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
//                                     ^
// [cfe] Operand of null-aware operation '!' has type 'String' which excludes null.
  }
  String call(int v) => "Lily was here: $v";
}

main() {
  C c = new C();
  c.test();
}
