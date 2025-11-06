// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The grammar is ambiguous with regard to the keyword `factory`.
/// For example, `factory() => C();` could be a method named factory with an
/// implicitly inferred return type, or it could be a factory constructor.
///
/// This ambiguity is resolved as follows: When a Dart parser expects to parse a
/// `<memberDeclaration>`, and the first token is `factory`, it proceeds to
/// parse the following input as a factory constructor.
///
/// @description Check that if the first token of a `<memberDeclaration>` is
/// `factory` then parser expects a factory constructor and it is a compile-time
/// error to declare a function named `factory` with an implicitly inferred
/// return type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

class C {
  factory() => C();
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  factory() => ET(0);
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(ET);
}
