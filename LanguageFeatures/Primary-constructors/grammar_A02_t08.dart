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
/// @description Check that it is not an error to declare a member with the name
/// `factory` if the first token of a `<memberDeclaration>` is `external` not
/// followed by the name `factory`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

class C1 {
  external C1 factory();
}

class C2 {
  external static factory();
}

extension type ET1(int _) {
  external ET1 factory();
}

extension type ET2(int _) {
  external static factory();
}

main() {
  if (1 > 2) {
    C1().factory();
    C2.factory();
    ET1(1).factory();
    ET2.factory();
  }
}
