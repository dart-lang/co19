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
/// `const` followed by `factory` then parser expects a factory constructor and
/// it is a compile-time error to call it as a function named `factory` with an
/// implicitly inferred return type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C {
  const C.create();

  const factory() = C.create;
}

extension type const ET.create(int _) {
  const factory(int v) = ET.create;
}

main() {
  C(); // Ok
  C.create().factory();
//           ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  ET(0); // Ok
  ET.create(0).factory();
//             ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
