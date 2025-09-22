// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let `D` be a class, extension type, or enum declaration.
/// ...
/// A compile-time error occurs if `D` includes a `<classNamePart>` that does
/// not contain a `<primaryConstructorNoConst>`, and the body of `D` contains a
/// `<declaringConstructorSignature>` that does not contain a
/// `<declaringParameterList>`.
///
/// @description Check that it is a compile-time error if `D` includes a
/// `<classNamePart>` that does not contain a `<primaryConstructorNoConst>`, and
/// the body of `D` contains a `<declaringConstructorSignature>` that does not
/// contain a `<declaringParameterList>`.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

class C {
  int v;
  this : v = 0;
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;

  this : assert(E.values.length == 1);
//     ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
}
