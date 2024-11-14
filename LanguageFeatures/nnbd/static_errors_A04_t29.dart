// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error if a top level variable or static variable with a
/// non-nullable type has no initializer expression unless the variable is
/// marked with a `late` or `external` modifier.
///
/// @description Check that it is not an error if a top level or static variable
/// with a non-nullable type has no initializer expression but is marked with a
/// `late` or `external `modifier. Test `FutureOr<F>` where `F` is a function
/// type.
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-strong

import "dart:async";

typedef void Foo();

late FutureOr<Function> f1;
late FutureOr<Foo> f2;
external FutureOr<Function> f3;
external FutureOr<Foo> f4;

class C {
  static late FutureOr<Function> x1;
  static late final FutureOr<Function> x2;
  static late FutureOr<Foo> x3;
  static late final FutureOr<Foo> x4;

  external static FutureOr<Function> x5;
  external static final FutureOr<Function> x6;
  external static FutureOr<Foo> x7;
  external static final FutureOr<Foo> x8;
}

main() {
  new C();
}
