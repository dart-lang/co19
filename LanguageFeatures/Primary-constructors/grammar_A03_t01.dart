// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `D` be a class, extension type, or enum declaration.
///
/// A compile-time error occurs if `D` includes a `<classNameMaybePrimary>` that
/// does not contain a `<primaryConstructor>`, and the body of `D` contains a
/// member declaration that starts with a `<primaryConstructorBodySignature>`.
///
/// @description Check that it is a compile-time error if `D` includes a
/// `<classNameMaybePrimary>` that does not contain a `<primaryConstructor>`,
/// and the body of `D` contains a member declaration that starts with a
/// `<primaryConstructorBodySignature>`. Test a class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C1 {
  this;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  int v;
  this: v = 0;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1 {
  e0;

  this;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2 {
  e0;
  final int v;
  this: v = 0;
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(E1);
  print(E2);
}
