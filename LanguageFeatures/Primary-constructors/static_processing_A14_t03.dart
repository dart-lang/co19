// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
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
/// Next, `k2` has the modifier `const` if and only if the keyword `const`
/// occurs just before the name of `D` or `D` is an `enum` declaration. In any
/// case, such an occurrence of `const` in the header of `D` is omitted in `D2`.
///
/// @description Check that it is a compile-time error is a primary constructor
/// is constant but initializer list in its body part initializes a variable by
/// a non-constant value.
/// @author sgrekhov22@gmail.com
/// @issue 62627

// SharedOptions=--enable-experiment=primary-constructors

int nonConstant = 42;

class const C() {
  final int v;
  this: v = nonConstant;
//          ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E() {
  e0;

  final int v;
  this: v = nonConstant;
//          ^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
}
