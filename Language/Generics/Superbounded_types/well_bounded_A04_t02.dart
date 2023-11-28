// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type `T` which is not well-bounded is a
/// compile-time error.
///
/// @description Checks that it is not an error when a function type with a
/// type parameter whose bound is a well-bounded type is declared.
/// @Issue 36959, 37050, 37034
/// @author iarkh@unipro.ru

class A<T extends A<T>> {}

typedef void B1<X extends A<dynamic>>();
typedef void B2<X extends A<Never>>();
typedef void B3<X extends A<Object?>>();
typedef void B4<X extends A<void>>();

typedef void B5<X extends A<A<dynamic>>>();
typedef void B6<X extends A<A<Never>>>();
typedef void B7<X extends A<A<Object?>>>();
typedef void B8<X extends A<A<void>>>();

main() {
  print(B1);
  print(B2);
  print(B3);
  print(B4);
  print(B5);
  print(B6);
  print(B7);
  print(B8);
}
