// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion <primaryConstructorBodySignature> ::= // New rule.
///      'this' <initializers>?;
///
/// <methodSignature> ::= // Add one new alternative.
///      ...
///    | <primaryConstructorBodySignature>;
///
/// <declaration> ::= // Add one new alternative.
///      ...
///    | <primaryConstructorBodySignature>;
///
/// @description Check that `<primaryConstructorBodySignature>` may have
/// metadata.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

const meta = 1;

class C(var int v) {
  @meta this;
}

mixin class M() {
  @meta this;
}

enum E(final int v) {
  e0(0);
  @meta this;
}

extension type ET(int _) {
  @meta this;
}

main() {
  print(C);
  print(M);
  print(E);
  print(ET);
}
