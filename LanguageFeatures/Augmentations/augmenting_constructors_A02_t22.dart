// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an augmenting function or constructor's signature
/// matches an introductory signature if:
/// - The two declarations have the same type parameters.
/// - The return type is the same as the introductory declaration's return type.
/// - It has the same number of positional parameters as the introductory
///   declaration, and the same number of those are optional.
/// - It has the same set of named parameter names as the introductory
///   declaration.
/// - For each corresponding pair of parameters:
///   - They have the same name. This is trivial for named parameters, but may
///     fail to hold for positional parameters.
///   - They have the same type.
///   - They both have the modifier `covariant`, or none of them have it.
///   - They both have the modifier `required`, or none of them have it.
/// ...
/// It is a compile-time error if:
/// - The signature of an augmenting constructor does not match the signature of
///   the corresponding introductory declaration.
///
/// @description Checks that it is a compile-time error if the signature of the
/// augmenting constructor does not match the signature of the corresponding
/// introductory constructor. Test private named parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  int _p;
  C({this._p = 0});
}

augment class C {
  augment C({int _p});
//               ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0();

  final int _p;
  const E({this._p = 1});
}

augment enum E {
  ;
  augment const E({int _p});
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _p) {
  ET.foo({this._p = 0});
}

augment extension type ET {
  augment ET.foo({int _p});
//                    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
