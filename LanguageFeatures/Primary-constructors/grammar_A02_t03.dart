// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The grammar is ambiguous with regard to the keyword `factory`.
/// For example, `factory() => C();` could be a method named `factory` with an
/// implicitly inferred return type, or it could be a factory constructor whose
/// name is the name of the enclosing class.
///
/// This ambiguity is resolved as follows: When a Dart parser expects to parse a
/// `<memberDeclaration>`, and the beginning of the declaration is `factory` or
/// one or more of the modifiers `const`, `augment`, or `external` followed by
/// `factory`, it proceeds to parse the following input as a factory constructor.
///
/// @description Check that if the first token of a `<memberDeclaration>` is
/// `augment` followed by `factory` then parser expects a factory constructor
/// and it is a compile-time error to call it as a function named `factory` with
/// an implicitly inferred return type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

class C1 {
  C1.create();
  factory();
}

augment class C1 {
  augment factory() => C1.create();
}

class C2 {
  const C2.create();
  const factory();
}

augment class C2 {
  augment const factory() => C2.create();
}

class C3 {
  C3.create();
  factory();
}

augment class C3 {
  augment external factory();
}

class C4 {
  C4.create();
  const factory();
}

augment class C4 {
  augment external const factory();
}

extension type ET1.create(int _) {
  factory();

  augment factory() => ET1.create(0);
}

extension type const ET2.create(int _) {
  factory();

  augment const factory() => ET2.create(0);
}

extension type const ET3.create(int _) {
  factory();

  augment external factory();
}

extension type ET4.create(int _) {
  const factory();

  augment external const factory();
}

main() {
  C1(); // Ok
  C1.create().factory();
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C2(); // Ok
  C2.create().factory();
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C3(); // Ok
  C3.create().factory();
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  C4(); // Ok
  C4.create().factory();
//            ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET1(0); // Ok
  ET1.create(0).factory();
//              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET2(0); // Ok
  ET2.create(0).factory();
//              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET3(0); // Ok
  ET3.create(0).factory();
//              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET4(0); // Ok
  ET4.create(0).factory();
//              ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
