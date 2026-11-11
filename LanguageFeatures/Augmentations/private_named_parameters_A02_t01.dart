// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A private named parameter must be either:
/// - An initializing formal.
/// - A declaring parameter.
/// - In an augmenting declaration.
///
/// @description Checks that it is a compile-time error if an introductory
/// function or method declares a private named parameter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

void f({int? _p});
//           ^^
// [analyzer] unspecified
// [cfe] unspecified

augment void f({int? _p}) {}

class C {
  void m1({int? _p});
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
  static void m2({int? _p});
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C {
  augment void m1({int? _p}) {}
  augment static void m2({int? _p}) {}
}

mixin M {
  void m1({int? _p});
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
  static void m2({int? _p});
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M {
  augment void m1({int? _p}) {}
  augment static void m2({int? _p}) {}
}

mixin class MC {
  void m1({int? _p});
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
  static void m2({int? _p});
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin class MC {
  augment void m1({int? _p}) {}
  augment static void m2({int? _p}) {}
}

enum E {
  e0;

  void m1({int? _p});
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
  static void m2({int? _p});
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment enum E {
  ;
  augment void m1({int? _p}) {}
  augment static void m2({int? _p}) {}
}

class A {}

extension Ext on A {
  void m1({int? _p});
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
  static void m2({int? _p});
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext {
  augment void m1({int? _p}) {}
  augment static void m2({int? _p}) {}
}

extension type ET(int id) {
  void m1({int? _p});
//              ^^
// [analyzer] unspecified
// [cfe] unspecified
  static void m2({int? _p});
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension type ET {
  augment void m1({int? _p}) {}
  augment static void m2({int? _p}) {}
}

main() {
  print(f);
  print(C);
  print(M);
  print(MC);
  print(E);
  print(A);
  print(ET);
}
