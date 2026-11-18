// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A private named parameter must be either:
/// - An initializing formal.
/// - A declaring parameter.
/// - In an augmenting declaration.
///
/// @description Checks that it is a compile-time error if an introductory
/// constructor declares a private named parameter which is neither an
/// initializing formal nor a declaring parameter, even if the augmenting
/// constructor declares the corresponding initializing formal.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  int? _p;
  C({int? _p});
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C {
  augment C({this._p});
}

enum E {
  e0;

  final int? _p;
  const E({int? _p});
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  ;
  augment const E({this._p});
}

extension type ET(int? _p) {
  ET.foo({int? _p});
//             ^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment ET.foo({this._p});
}

main() {
  print(C);
  print(E);
  print(ET);
}
