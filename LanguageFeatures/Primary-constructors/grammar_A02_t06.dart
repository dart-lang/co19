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
/// `factory` if the first token of a `<memberDeclaration>` is not `factory`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

import '../../Utils/expect.dart';

class C1 {
  final int v;
  C1(this.v);
  C1 factory() => C1(1);
}

class C2 {
  final int v;
  C2(this.v);
  static factory() => C2(2);
}

extension type ET1(int v) {
  ET1 factory() => ET1(1);
}

extension type ET2(int v) {
  static factory() => ET2(2);
}

main() {
  Expect.equals(1, C1(42).factory().v);
  Expect.equals(2, C2.factory().v);
  Expect.equals(1, ET1(42).factory().v);
  Expect.equals(2, ET2.factory());
}
