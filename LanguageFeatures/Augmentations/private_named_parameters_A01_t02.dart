// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All corresponding parameter names must be the same in the
/// introductory declaration and all augmentations. When augmenting or being
/// augmented by a declaration with a private named parameter, when we say
/// "name", we mean the declared private name of the parameter, not its
/// corresponding public name.
///
/// @description Checks that it is a compile-time error if an introductory
/// constructor has a public named parameter and the augmenting constructor
/// declares an initializing formal with the corresponding private name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  int? _p; // ignore: unused_field
  C({int? p});
}

augment class C {
  augment C({this._p});
//                ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;

  // The introductory constructor doesn't initialize `_p`. If the analysis takes
  // `this._p` in the augmenting constructor below into account, then there is
  // no error here. If the augmenting constructor is rejected entirely because
  // of the error in it, then there may be an error here as well. Currently
  // (November 2026) the tools report an error on the introductory constructor
  // (the final field `_p` is not initialized), so we expect it there.
  final int? _p; // ignore: unused_field
  E({int? p}); // ignore: unused_element_parameter
//^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  ;
  augment E({this._p});
//                ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int? _p) {
  ET.foo({int? p});
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment ET.foo({this._p});
//                ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
