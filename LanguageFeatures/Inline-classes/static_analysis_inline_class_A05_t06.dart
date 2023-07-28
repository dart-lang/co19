// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that T1, .. Ts are types, and V resolves to an extension
/// type declaration of the following form:
///
/// extension type V<X1 extends B1, .. Xs extends Bs>(T id) ... {
///   ... // Members.
/// }
/// ...
/// When s is zero (that is, the declaration of V is not generic), V<T1, .. Ts>
/// simply stands for V, a non-generic extension type. When s is greater than
/// zero, a raw occurrence V is treated like a raw type: Instantiation to bound
/// is used to obtain the omitted type arguments.
///
/// @description Checks that it is a compile-time error to use super-bounded
/// extension type with wrong type arguments
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

class A<T extends A<T>> {}

extension type V<T extends A<T>>(int id) {
  Type get type => T;
}

main() {
  var v1 = V<void>(42);
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var v2 = V<Object?>(42);
//           ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var v3 = V<dynamic>(42);
//           ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var v4 = V<Null>(42);
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var v5 = V<A>(42);
//           ^
// [analyzer] unspecified
// [cfe] unspecified

  var v6 = V<A<Object?>>(42);
//           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var v7 = V<A<void>>(42);
//           ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var v8 = V<A<Null>>(42);
//           ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var v9 = V<A<dynamic>>(42);
//           ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
