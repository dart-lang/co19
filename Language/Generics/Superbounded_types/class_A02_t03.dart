// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a parameterized type `T` is
/// super-bounded when it is used in any of the following ways:
/// - `T` is an immediate subterm of a new expression or a constant object
///   expression.
///
/// @description Checks that it is not an error if a parametrized super-bounded
/// type is used in a constant `is` expression.
/// @Issue 37033, 42415
/// @author iarkh@unipro.ru

class A<T extends A<T>> {
  const A();
}

const b1 = 1 is A;
const b2 = 1 is A<dynamic>;
const b3 = 1 is A<Object?>;
const b5 = 1 is A<Never>;
const b6 = 1 is A<void>;

const b7 = 1 is A<A>;
const b8 = 1 is A<A<dynamic>>;
const b9 = 1 is A<A<Object?>>;
const b11 = 1 is A<A<Never>>;
const b12 = 1 is A<A<void>>;

main() {
  print(b1);
  print(b2);
  print(b3);
  print(b5);
  print(b6);
  print(b7);
  print(b8);
  print(b9);
  print(b11);
  print(b12);
}
