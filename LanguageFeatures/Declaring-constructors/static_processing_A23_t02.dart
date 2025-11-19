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
/// constructor contains two formal parameters with the same name.
/// Test declaring vs. super parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class A<T> {
  final T? v;
  A(this.v);
}

class C1<T>(@override var T? v, super.v) extends A<T>;
//                              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C2 extends A<String> {
  this(@override final String v, [super.v = ""]);
//                                ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3<T>(final T? v, {super.v}) extends A<T>;
//                       ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class C4 extends A<String>{
  this(final String v, {required super.v});
//                               ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
}
