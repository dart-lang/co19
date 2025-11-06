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
/// `<declaringParameterList>`. Test an extension type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

extension type ET1(final int v) {
  this();
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2(int v) {
  this(final int v);
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3(int v) {
  this(int v);
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET4(final int v) {
  this(this.v);
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET5.someName(final int v) {
  this.someName(final int v);
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET6.someName(final int v) {
  this.anotherName(final int v);
//                ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
}
