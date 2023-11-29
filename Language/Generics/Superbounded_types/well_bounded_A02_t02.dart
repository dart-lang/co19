// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type `T` which is not well-bounded is a
/// compile-time error.
///
/// @description Checks that it is not an error when a function with a type
/// parameter whose bound is super-bounded type is declared
/// @Issue 36959, 37028, 37050
/// @author iarkh@unipro.ru

class A<T extends A<T>> {}

void testme1<X extends A<dynamic>>() {}
void testme2<X extends A<Object?>>() {}
void testme3<X extends A<Never>>() {}
void testme4<X extends A<void>>() {}

void testme5<X extends A<A<dynamic>>>() {}
void testme6<X extends A<A<Object?>>>() {}
void testme7<X extends A<A<Never>>>() {}
void testme8<X extends A<A<void>>>() {}

main() {
  testme1();
  testme2();
  testme3();
  testme4();
  testme5();
  testme6();
  testme7();
  testme8();
}
