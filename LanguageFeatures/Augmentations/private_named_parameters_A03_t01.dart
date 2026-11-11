// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All corresponding parameter names must be the same in the
/// introductory declaration and all augmentations. When augmenting or being
/// augmented by a declaration with a private named parameter, when we say
/// "name", we mean the declared private name of the parameter, not it's
/// corresponding public name.
/// ...
/// The introductory declaration can't also use an initializing formal or
/// declaring parameter because then both declarations are complete.
///
/// @description Checks that it is a compile-time error if both the introductory
/// and the augmenting constructors declare the same private named initializing
/// formal.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  int? _p;
  C({this._p});
}

augment class C {
  augment C({this._p});
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;

  final int? _p;
  const E({this._p});
}

augment enum E {
  ;
  augment const E({this._p});
//                 ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int? _p) {
  ET.foo({this._p});
}

augment extension type ET {
  augment ET.foo({this._p});
//                ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
