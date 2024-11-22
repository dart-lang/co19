// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error if a class declaration declares an instance
/// variable with a potentially non-nullable type and no initializer expression,
/// and the class has a generative constructor where the variable is not
/// initialized via an initializing formal or an initializer list entry, unless
/// the variable is marked with a `late`, `abstract`, or `external` modifier.
///
/// @description Check that it is not an error if a class declaration declares
/// an instance variable with a potentially non-nullable type and no initializer
/// expression, and the class has a generative constructor where the variable is
/// not initialized via an initializing formal or an initializer list entry, but
/// the variable is marked with a `late` or `abstract` modifier. Test
/// `FutureOr<A>` where `A` is some class.
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-strong

import "dart:async";

class A {}

abstract class B {
  abstract FutureOr<A> x1;
  abstract final FutureOr<A> x2;
  abstract covariant FutureOr<A> x3;
}
class C {
  late FutureOr<A> x1;
  late final FutureOr<A> x2;
  covariant late FutureOr<A> x3;
}

main() {
  print(B);
  new C();
}
