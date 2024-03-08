// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider an invocation of the extension type member m on the
/// receiver expression e according to the extension type declaration V with the
/// actual type arguments T1, ..., Ts.
/// ...
/// V has an extension type member m with a uniquely determined declaration Dm
/// ...
/// Assume that Dm is a method with function type F, and typeArgs is provided. A
/// compile-time error occurs if F is not a generic function type where typeArgs
/// is a list of actual type arguments that conform to the declared bounds. If
/// no error occurred, the invocation has the static type which is a non-generic
/// function type where typeArgs are substituted into the function type.
///
/// @description Checks that it is a compile-time error to specify a wrong
/// type argument of a torn-off method
/// @author sgrekhov22@gmail.com

extension type ET1(int id) {
  int foo<T1, T2 extends num>() => 42;
}

main() {
  ET1 et1 = ET1(42);
  et1.foo<String, String>;
//                ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
