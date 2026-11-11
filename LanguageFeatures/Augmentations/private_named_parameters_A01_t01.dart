// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All corresponding parameter names must be the same in the
/// introductory declaration and all augmentations. When augmenting or being
/// augmented by a declaration with a private named parameter, when we say
/// "name", we mean the declared private name of the parameter, not it's
/// corresponding public name.
///
/// @description Checks that it is a compile-time error if an introductory
/// constructor has a private named parameter and the augmenting constructor
/// declares the corresponding public name instead of the private name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  int _p;
  C({this._p = 0});
}

augment class C {
  augment C({int p});
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0(p: 0);

  final int _p;
  E({this._p = 1});
}

augment enum E {
  ;
  augment E({int p});
//                     ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _p) {
  ET.foo({this._p = 0});
}

augment extension type ET {
  augment ET.foo({int p});
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
