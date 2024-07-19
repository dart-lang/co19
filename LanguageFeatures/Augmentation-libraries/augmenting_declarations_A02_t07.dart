// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion For the following, we’ll say that one declaration of a library is
/// above another declaration of the same library if and only if:
/// - The former declaration is in the same file as the latter declaration, and
///   it is textually earlier in the file (“above” in the source code as
///   normally presented), or
/// - The former declaration is in a file that is a direct or transitive parent
///   file of the file of the latter declaration (“above” in the file tree
///   hierarchy).
/// We can similarly define below as the inverse of that relation. Both before
/// and after define strict partial orders on declarations in a library.
///
/// It’s a compile-time error if a library contains an augmentation declaration
/// and a corresponding non-augmentation base declaration, and the base
/// declaration is not above the augmentation declaration.
///
/// @description Checks that it is a compile-time error if a base declaration is
/// not above the augmentation declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

class C {
  augment static int staticVariable = 0;
//                   ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod() {}
//                    ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int get staticGetter => 0;
//                       ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set staticSetter(int _) {}
//                        ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int instanceVariable = 0;
//            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod() {}
//             ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int get instanceGetter => 0;
//                ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter(int _) {}
//                 ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  augment static int staticVariable = 0;
//                   ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod() {}
//                    ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int get staticGetter => 0;
//                       ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set staticSetter(int _) {}
//                        ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int instanceVariable = 0;
//            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod() {}
//             ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int get instanceGetter => 0;
//                ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter(int _) {}
//                 ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  augment static int staticVariable = 0;
//                   ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod() {}
//                    ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int get staticGetter => 0;
//                       ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set staticSetter(int _) {}
//                        ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment final int instanceVariable = 0;
//                  ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod() {}
//             ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int get instanceGetter => 0;
//                ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter(int _) {}
//                 ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  augment static int staticVariable = 0;
//                   ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod() {}
//                    ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int get staticGetter => 0;
//                       ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set staticSetter(int _) {}
//                        ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod() {}
//             ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int get instanceGetter => 0;
//                ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter(int _) {}
//                 ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  augment static int staticVariable = 0;
//                   ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void staticMethod() {}
//                    ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int get staticGetter => 0;
//                       ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set staticSetter(int _) {}
//                        ^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void instanceMethod() {}
//             ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment int get instanceGetter => 0;
//                ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment void set instanceSetter(int _) {}
//                 ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C {
  static int staticVariable = 0;
  static void staticMethod() {}
  static int get staticGetter => 0;
  static void set staticSetter(int _) {}
  int instanceVariable = 0;
  void instanceMethod() {}
  int get instanceGetter => 0;
  void set instanceSetter(int _) {}
}

augment mixin M {
  static int staticVariable = 0;
  static void staticMethod() {}
  static int get staticGetter => 0;
  static void set staticSetter(int _) {}
  int instanceVariable = 0;
  void instanceMethod() {}
  int get instanceGetter => 0;
  void set instanceSetter(int _) {}
}

augment enum E {
  augment e0;
  static int staticVariable = 0;
  static void staticMethod() {}
  static int get staticGetter => 0;
  static void set staticSetter(int _) {}
  final int instanceVariable = 0;
  void instanceMethod() {}
  int get instanceGetter => 0;
  void set instanceSetter(int _) {}
}

augment extension Ext  {
  static int staticVariable = 0;
  static void staticMethod() {}
  static int get staticGetter => 0;
  static void set staticSetter(int _) {}
  int get instanceGetter => 0;
  void set instanceSetter(int _) {}
}

augment extension type ET(int _) {
  static int staticVariable = 0;
  static void staticMethod() {}
  static int get staticGetter => 0;
  static void set staticSetter(int _) {}
  void instanceMethod() {}
  int get instanceGetter => 0;
  void set instanceSetter(int _) {}
}

main() {
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
