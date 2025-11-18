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
/// `external` followed by `factory` or `const factory` then parser expects a
/// factory constructor and it is a compile-time error to call it as a function
/// named `factory` with an implicitly inferred return type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C1 {
  C1.create();

  external factory();
}

class C2 {
  C2.create();

  external const factory();
}

extension type ET1.create(int _) {
  external factory();
}

extension type const ET2.create(int _) {
  external const factory();
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
}
