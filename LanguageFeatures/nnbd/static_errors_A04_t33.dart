// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error if a top level variable or static variable with a
/// non-nullable type has no initializer expression unless the variable is
/// marked with a `late` or `external` modifier.
///
/// @description Check that it is not an error if a top level or static variable
/// with a non-nullable type has no initializer expression but is marked with a
/// `late` or `external `modifier. Test `FutureOr<FutureOr<A>>` where `A` is
/// some class.
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-strong

import "dart:async";

class A {}

late FutureOr<FutureOr<A>> x1;
external FutureOr<FutureOr<A>> x2;

class C {
  static late FutureOr<FutureOr<A>> x1;
  static late final FutureOr<FutureOr<A>> x2;
  external static FutureOr<FutureOr<A>> x3;
  external static final FutureOr<FutureOr<A>> x4;
}

main() {
  new C();
}
