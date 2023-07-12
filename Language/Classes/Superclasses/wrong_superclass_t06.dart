// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the type in the extends clause of a
/// class C is a type variable, a type alias that does not denote a class, an
/// enumerated type, a deferred type, type dynamic, or type FutureOr<T> for any
/// T.
///
/// @description Checks that it is a compile-time error if `FutureOr<T>` is used
/// as a superclass
/// @author sgrekhov22@gmail.com

class A {}

class C1<T> extends FutureOr<T> {}
//                  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C2 extends FutureOr<A> {}
//               ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  C1();
  C2();
}
