// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A private named parameter must be either:
/// - An initializing formal.
/// - A declaring parameter.
/// - In an augmenting declaration.
///
/// @description Checks that it is a compile-time error if an augmenting
/// function declares a private named parameter and the introductory function
/// declares the corresponding public name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

void f({int? p});

augment void f({int? _p}) {}
//                   ^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  void m1({int? p});
  static void m2({int? p});
}

augment class C {
  augment void m1({int? _p}) {}
//                      ^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void m2({int? _p}) {}
//                             ^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  void m1({int? p});
  static void m2({int? p});
}

augment mixin M {
  augment void m1({int? _p}) {}
//                      ^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void m2({int? _p}) {}
//                             ^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class MC {
  void m1({int? p});
  static void m2({int? p});
}

augment mixin class MC {
  augment void m1({int? _p}) {}
//                      ^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void m2({int? _p}) {}
//                             ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;

  void m1({int? p});
  static void m2({int? p});
}

augment enum E {
  ;
  augment void m1({int? _p}) {}
//                      ^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void m2({int? _p}) {}
//                             ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  void m1({int? p});
  static void m2({int? p});
}

augment extension Ext {
  augment void m1({int? _p}) {}
//                      ^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void m2({int? _p}) {}
//                             ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int id) {
  void m1({int? p});
  static void m2({int? p});
}

augment extension type ET {
  augment void m1({int? _p}) {}
//                      ^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void m2({int? _p}) {}
//                             ^^
// [analyzer] unspecified
// [cfe] unspecified
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
