// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `D` be a class, extension type, or enum declaration.
///
/// A compile-time error occurs if `D` includes a `<classNamePart>` that
/// contains a `<primaryConstructorNoConst>`, and the body of `D` contains a
/// `<declaringConstructorSignature>` that contains a `<declaringParameterList>`.
///
/// @description Check that it is a compile-time error if `D` includes a
/// `<classNamePart>` that contains a `<primaryConstructorNoConst>`, and the
/// body of `D` contains a `<declaringConstructorSignature>` that contains a
/// `<declaringParameterList>`. Test a class.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

class C1(var int v) {
  this();
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2() {
  this();
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3(int v) {
  this(int v);
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C4(final int v) {
  this(this.v);
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C5.someName(final int v) {
  this.someName(final int v);
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C6.someName(final int v) {
  this.anotherName(final int v);
//                ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
  print(C5);
  print(C6);
}
