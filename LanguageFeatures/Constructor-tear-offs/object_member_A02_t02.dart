// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When C is a type literal, C<int> is regular-bounded parameterized
/// type, and C.m is the name of a constructor, an expression of the form
/// C<int>.m(...) denotes an instance creation and C<int>.m denotes a
/// constructor tearoff, and they are not errors. When C.m is not a constructor
/// name, those forms are a compile-time error, even in the case where Type has
/// a member named m (for instance, C<int>.toString() is an error unless
/// C.toString is a constructor).
///
/// @description Checks that if C is a type literal, C<int> is regular-bounded
/// parameterized type, and C.m is a constructor name, those forms are not a
/// compile-time error, even in the case where Type has a member named m
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class C<T> {
  C.toString() {}
}

main() {
  Expect.isTrue(C<int>.toString() is C);
  Expect.isTrue(C.toString() is C);
  Expect.isTrue(C<int>.toString is Function);
  Expect.isTrue(C.toString is Function);
  Expect.runtimeIsType<C>(C<int>.toString());
  Expect.runtimeIsType<C>(C.toString());
  Expect.runtimeIsType<Function>(C<int>.toString);
  Expect.runtimeIsType<Function>(C.toString);
}
