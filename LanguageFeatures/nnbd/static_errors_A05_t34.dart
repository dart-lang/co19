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
/// `FutureOr<FutureOr<A>>` where `A` is some class.
/// @author sgrekhov@unipro.ru

import "dart:async";

class A {}

abstract class B {
  abstract FutureOr<FutureOr<A>> x1;
  abstract final FutureOr<FutureOr<A>> x2;
  abstract covariant FutureOr<FutureOr<A>> x3;
}

class C {
  late FutureOr<FutureOr<A>> x1;
  late final FutureOr<FutureOr<A>> x2;
  covariant late FutureOr<FutureOr<A>> x3;
}

main() {
  print(A);
  new C();
}
