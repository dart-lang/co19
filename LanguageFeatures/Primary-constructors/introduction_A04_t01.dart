// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion With this feature, all other declarations of formal parameters as
/// `final` will be a compile-time error. This ensures that `final int x` is
/// unambiguously a declaring parameter. Developers who wish to maintain a style
/// whereby formal parameters are never modified will have a lint to flag all
/// such mutations.
///
/// Similarly, with this feature a regular (non-declaring) formal parameter can
/// not use the syntax `var name`, it must have a type (`T name`) or the type
/// must be omitted (`name`).
///
/// @description Check that it is a compile-time error to declare a setter with 
/// a `final` formal parameter.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

void set topLevel1(final v) {}
//                 ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
void set topLevel2(final int v) {}
//                 ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static void set staticSetter1(final v) {}
//                              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void set staticSetter2(final int v) {}
//                              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set instanceSetter1(final v) {}
//                         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set instanceSetter2(final int v) {}
//                         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M {
  static void set staticSetter1(final v) {}
//                              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void set staticSetter2(final int v) {}
//                              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set instanceSetter1(final v) {}
//                         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set instanceSetter2(final int v) {}
//                         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  static void set staticSetter1(final v) {}
//                              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void set staticSetter2(final int v) {}
//                              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set instanceSetter1(final v) {}
//                         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set instanceSetter2(final int v) {}
//                         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A {}

extension Ext on A {
  static void set staticSetter1(final v) {}
//                              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void set staticSetter2(final int v) {}
//                              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set instanceSetter1(final v) {}
//                         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set instanceSetter2(final int v) {}
//                         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  static void set staticSetter1(final v) {}
//                              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  static void set staticSetter2(final int v) {}
//                              ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set instanceSetter1(final v) {}
//                         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set instanceSetter2(final int v) {}
//                         ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  topLevel1 = 1;
  topLevel2 = 2;
  print(C);
  print(M);
  print(E);
  print(A);
  print(ET);
}
