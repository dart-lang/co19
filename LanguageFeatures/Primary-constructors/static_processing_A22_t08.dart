// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The semantics of the primary constructor is found in the
/// following steps, where `D` is the class, mixin class, extension type, or
/// enum declaration in the program that includes a primary constructor `k`, and
/// `D2` is the result of the derivation of the semantics of `D`. The derivation
/// step will delete elements that amount to the primary constructor.
/// Semantically, it will add a new constructor `k2`, and it will add zero or
/// more instance variable declarations.
/// ...
/// The formal parameter list `L2` of `k2` is identical to `L`, except that each
/// formal parameter is processed as follows.
/// ...
/// - Otherwise, it is a declaring parameter. A formal parameter (named or
///   positional) of the form `var T p` or `final T p` where `T` is a type and
///   `p` is an identifier is replaced in `L2` by `this.p`, along with its
///   default value, if any. The same is done in the case where the formal
///   parameter has the form `var p` or `final p`, and `T` is the declared type
///   of `p` which was obtained by inference. If the parameter has the modifier
///   `var` and `D` is an extension type declaration then a compile-time error
///   occurs. Otherwise, if `D` is not an extension type declaration, a semantic
///   instance variable declaration corresponding to the syntax `T p;` or
///   `final T p;` is added to `D2`. It includes the modifier `final` if and
///   only if the parameter in `L` has the modifier `final` and `D` is not an
///   extension type declaration. Otherwise, if `D` is an extension type
///   declaration then the name of `p` specifies the name of the representation
///   variable. In all cases, if `p` has the modifier `covariant` then this
///   modifier is removed from the parameter in `L2`, and it is added to the
///   instance variable declaration named `p`.
///
/// @description Check that it is a compile-time error if a primary constructor
/// contains a formal parameter of the form `var T p` or `final T p` and the
/// enclosing class/enum/extension type contains a static member named `p`. Test
/// required named parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C<T>({required var int v1, required final T v2, required var bool v3}) {
  static int get v1 => 0;
//               ^^
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

extension type ET1<T>({required final T v}) {
  static void v() {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET2({required String v}) {
  static String get v => "";
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E<T>({
    required final T v1,
    required final String v2,
    required final bool v3}) {
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

main() {
  print(C);
  print(ET1);
  print(ET2);
  print(E);
}
