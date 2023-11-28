// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type [T] which is not well-bounded is a
/// compile-time error.
///
/// @description Checks that it is not an error when a function alias with a
/// well-bounded type parameter is declared
/// @Issue 36959, 37050, 37034
/// @author iarkh@unipro.ru

class A<T extends A<T>> {}

typedef B1<X extends A<dynamic>> = void Function();
typedef B2<X extends A<Never>>   = void Function();
typedef B3<X extends A<Object?>> = void Function();
typedef B4<X extends A<void>>    = void Function();

typedef B5<X extends A<A<dynamic>>> = void Function();
typedef B6<X extends A<A<Never>>>   = void Function();
typedef B7<X extends A<A<Object?>>> = void Function();
typedef B8<X extends A<A<void>>>    = void Function();

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
