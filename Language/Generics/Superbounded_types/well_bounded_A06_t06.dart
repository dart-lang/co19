// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type `T` which is not well-bounded is a
/// compile-time error.
///
/// @description Checks that it is not an error if a well-bounded type is used
/// as the right hand operand in a constant `as` expression.
/// @Issue 37033, 42415
/// @author iarkh@unipro.ru

class A<T extends A<T>> {
  const A();
}

const b1 = null as A?;

const b2 = null as A<dynamic>?;
const b3 = null as A<Object?>?;
const b4 = null as A<Never>?;
const b5 = null as A<void>?;

const b6 = null as A<A>?;
const b7 = null as A<A<dynamic>>?;
const b8 = null as A<A<Object?>>?;
const b9 = null as A<A<Never>>?;
const b10 = null as A<A<void>>?;

main() {
  print(b1);
  print(b2);
  print(b3);
  print(b4);
  print(b5);
  print(b6);
  print(b7);
  print(b8);
  print(b9);
  print(b10);
}
