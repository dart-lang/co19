// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if an element in the type list of the
/// implements clause of a class C is a type variable, a type alias that does
/// not denote a class, an enumerated type, a deferred type, type dynamic, or
/// type FutureOr<T> for any T.
///
/// @description Checks that it is a compile-time error when the type expression
/// in a class's implements clause denotes a function type.
/// @author rodionov

typedef void Foo();
typedef int Baz<T extends num>(T t, {String s});

class A implements Foo {}
//                 ^
// [analyzer] unspecified
// [cfe] unspecified

class B implements Baz {}
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

class C implements Baz<int> {}
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  A();
  B();
  C();
}
