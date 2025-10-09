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
/// @description Check that it is a compile time error to assign a value to a
/// final instance variable introduced by a required named parameter of a
/// declaring constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

class C1<T>({required final T v});

class C2({required final String v});

class C3<T> {
  this({required final T v});
}

class C4 {
  this({required final String v});
}

extension type ET1<T>({required final T v});

extension type ET2({required String v});

extension type ET3<T> {
  this({required final T t});
}

extension type ET4 {
  this({required final String v});
}

enum E1<T>({required final T v}) {
  e0<String>(v: "E1");
}

enum E2({required final String v}) {
  e0(v: "E2");
}

enum E3<T> {
  e0<String>(v: "E3");
  const this({required final T v});
}

enum E4 {
  e0(v: "E4");
  const this({required final String v});
}

main() {
  C1<String>(v: "C1").v = "";
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

  C2(v: "C2").v = "";
//              ^
// [analyzer] unspecified
// [cfe] unspecified

  C3<String>(v: "C3").v = "";
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

  C4(v: "C4").v = "";
//              ^
// [analyzer] unspecified
// [cfe] unspecified

  ET1<String>(v: "ET1").v = "";
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

  ET2(v: "ET2").v = "";
//                ^
// [analyzer] unspecified
// [cfe] unspecified

  ET3<String>(v: "ET3").v = "";
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

  ET4(v: "ET4").v = "";
//                ^
// [analyzer] unspecified
// [cfe] unspecified

  E1.e0.v = "";
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  E2.e0.v = "";
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  E3.e0.v = "";
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  E4.e0.v = "";
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}
