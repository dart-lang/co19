// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion <primaryConstructorBodySignature> ::= // New rule.
//      'this' <initializers>?;
///
/// @description Check that it is a syntax error if
/// `<primaryConstructorBodySignature>` contains any metadata.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

const meta = 1;

class C(var int v) {
  @meta this;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin class M() {
  @meta this;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E(final int v) {
  e0(0);
  @meta this;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int _) {
  @meta this;
//^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
  print(E);
  print(ET);
}
