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
/// @description Checks that it is a compile-time error if an augmenting
/// declaration appears before non-augmenting one. Test augmented declaration in
/// a main library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import augment 'augmenting_declarations_A02_t04_lib.dart';

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

extension Etx on A {
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

main() {
  print(C);
  print(M);
  print(E);
  print(A);
}
