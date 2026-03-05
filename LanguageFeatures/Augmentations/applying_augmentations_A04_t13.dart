// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if there is no matching declaration `I`.
/// In other words, it's an error to have a declaration marked augment with no
/// declaration to apply it to.
///
/// @description Checks that it is a compile-time error to augment a static
/// member that doesn't exist.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  void instanceMethod() {}
  int get instanceGetter => 0;
  void set instanceSetter(int v) {}
  int instanceVariable = 0;
}

augment class C {
  augment static void instanceMethod();
//                    ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int get instanceGetter;
//                       ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set instanceSetter(int v);
//                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static abstract int instanceVariable;
//                            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  void instanceMethod() {}
  int get instanceGetter => 0;
  void set instanceSetter(int v) {}
  int instanceVariable = 0;
}

augment mixin M {
  augment static void instanceMethod();
//                    ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int get instanceGetter;
//                       ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set instanceSetter(int v);
//                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static abstract int instanceVariable;
//                            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e1;
  void instanceMethod() {}
  int get instanceGetter => 0;
  void set instanceSetter(int v) {}
  final int instanceVariable = 0;
}

augment enum E {
  ;
  augment static void instanceMethod();
//                    ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int get instanceGetter;
//                       ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set instanceSetter(int v);
//                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static abstract int instanceVariable;
//                            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  void instanceMethod() {}
  int get instanceGetter => 0;
  void set instanceSetter(int v) {}
}

augment extension Ext {
  augment static void instanceMethod();
//                    ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int get instanceGetter;
//                       ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set instanceSetter(int v);
//                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static abstract int instanceVariable;
//                            ^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int instanceVariable) {
  void instanceMethod() {}
  int get instanceGetter => 0;
  void set instanceSetter(int v) {}
}

augment extension type ET {
  augment static void instanceMethod();
//                    ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static int get instanceGetter;
//                       ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static void set instanceSetter(int v);
//                        ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment static abstract int instanceVariable;
//                            ^^^^^^^^^^^^^^^^
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
