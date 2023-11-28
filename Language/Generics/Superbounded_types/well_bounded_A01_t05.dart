// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type `T` which is not well-bounded is a
/// compile-time error.
///
/// @description Checks that it is not an error when a class with a
/// super-bounded type parameter is declared
/// @Issue 37034, 37050
/// @author iarkh@unipro.ru

class A<T extends A<T>> {}

class B1<X extends A<X>> {}
class B2<X extends A<A<Object?>>> {}
class B3<X extends A<A<dynamic>>> {}
class B4<X extends A<A<void>>> {}
class B5<X extends A<A<Never>>> {}

main() {
  B1<Never>();
  B2();
  B3();
  B4();
  B5();
}
