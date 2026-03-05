// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if there is no matching declaration `I`.
/// In other words, it's an error to have a declaration marked augment with no
/// declaration to apply it to.
///
/// @description Checks that it is a compile-time error to augment an instance
/// member that doesn't exist.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  static void staticMethod() {}
  static int get staticGetter => 0;
  static void set staticSetter(int v) {}
  static int staticVariable = 0;
}

augment class C {
  augment void staticMethod();
//             ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int get staticGetter;
//                ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set staticSetter(int v);
//                 ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract int staticVariable;
//                     ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static void staticMethod() {}
  static int get staticGetter => 0;
  static void set staticSetter(int v) {}
  static int staticVariable = 0;
}

augment mixin M {
  augment void staticMethod();
//             ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int get staticGetter;
//                ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set staticSetter(int v);
//                 ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract int staticVariable;
//                     ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e1;
  static void staticMethod() {}
  static int get staticGetter => 0;
  static void set staticSetter(int v) {}
  static int staticVariable = 0;
}

augment enum E {
  ;
  augment void staticMethod();
//             ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int get staticGetter;
//                ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set staticSetter(int v);
//                 ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment abstract int staticVariable;
//                     ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static void staticMethod() {}
  static int get staticGetter => 0;
  static void set staticSetter(int v) {}
}

augment extension Ext {
  augment void staticMethod();
//             ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int get staticGetter;
//                ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set staticSetter(int v);
//                 ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static void staticMethod() {}
  static int get staticGetter => 0;
  static void set staticSetter(int v) {}
}

augment extension type ET {
  augment void staticMethod();
//             ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int get staticGetter;
//                ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set staticSetter(int v);
//                 ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
