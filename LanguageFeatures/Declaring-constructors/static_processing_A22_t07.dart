// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The semantics of the declaring constructor is found in the
/// following steps, where `D` is the class, extension type, or enum declaration
/// in the program that includes a declaring constructor `k`, and `D2` is the
/// result of the derivation of the semantics of `D`. The derivation step will
/// delete elements that amount to the declaring constructor. Semantically, it
/// will add a new constructor `k2`, and it will add zero or more instance
/// variable declarations.
/// ...
/// Otherwise, a formal parameter (named or positional) of the form` var T p` or
/// `final T p` where `T` is a type and `p` is an identifier is replaced in `L2`
/// by `this.p`, along with its default value, if any. Next, a semantic instance
/// variable declaration corresponding to the syntax `T p;` or `final T p;` is
/// added to `D2`. It includes the modifier `final` if the parameter in `L` has
/// the modifier `final`, or `D` is an extension type declaration and `k` is a
/// declaring header constructor. In all cases, if `p` has the modifier
/// `covariant` then this modifier is removed from the parameter in `L2`, and it
/// is added to the instance variable declaration named `p`.
///
/// @description Check that it is a compile-time error if a declaring
/// constructor contains a formal parameter of the form `var T p` or
/// `final T p` and the enclosing class/enum/extension type contains a static
/// member named `p`. Test optional named parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

class C1<T>({var String v1 = "", final T? v2, var bool v3 = true}) {
  static String get v1 => "";
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified
  static T v2;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  static void v3() {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2<T> {
  this({var String v1 = "", final T? v2, var bool v3 = true});
  static String get v1 => "";
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified
  static T v2;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified

  static void v3() {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET1<T>({final T? v}) {
  static void v() {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2({String v = ""}) {
  static String get v => "";
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET3<T> {
  this({final T? v});

  static void v() {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET4 {
  this({final String v = ""});

  static String get v => "";
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E1<T>({final T? v1, final String v2 = "", final bool v3 = true}) {
  e0<int>();

  static final T v1;
//               ^^
// [analyzer] unspecified
// [cfe] unspecified
  static String get v2 => "";
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified
  static void v3() {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2<T> {
  e0<int>();

  this({final T? v1, final String v2 = "", final bool v3 = true});

  static final T v1;
//               ^^
// [analyzer] unspecified
// [cfe] unspecified
  static String get v2 => "";
//                  ^^
// [analyzer] unspecified
// [cfe] unspecified
  static void v3() {}
//            ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(ET1);
  print(ET2);
  print(ET3);
  print(ET4);
  print(E1);
  print(E2);
}
