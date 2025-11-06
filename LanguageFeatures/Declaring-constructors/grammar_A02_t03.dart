// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `D` be a class, extension type, or enum declaration.
///
/// A compile-time error occurs if `D` includes a `<classNameMaybePrimary>` that
/// contains a `<primaryConstructor>`, and the body of `D` contains a
/// `<declaringConstructorSignature>` that contains a `<declaringParameterList>`.
///
/// @description Check that it is a compile-time error if `D` includes a
/// `<classNameMaybePrimary>` that contains a `<primaryConstructor>`, and the
/// body of `D` contains a `<declaringConstructorSignature>` that contains a
/// `<declaringParameterList>`. Test an enum.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

enum const E1(final int v) {
  e1(1);

  this();
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2() {
  e2;

  this();
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum const E3(final int v) {
  e3(3);

  this(final int v);
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E4(final int v) {
  e4(4);

  this(this.v);
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum const E5.someName(final int v) {
  e5.someName(5);

  this.someName(final int v);
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E6.someName(final int v) {
  e6.someName(5);

  this.anotherName(final int v);
//                ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E1);
  print(E2);
  print(E3);
  print(E4);
  print(E5);
  print(E6);
}
