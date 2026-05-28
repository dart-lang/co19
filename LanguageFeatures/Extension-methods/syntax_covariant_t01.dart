// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion an extension declaration is a top-level declaration with a grammar
/// similar to:
/// <extension> ::=
///   `extension' <identifier>? <typeParameters>? `on' <type> `?'? `{'
///     memberDeclaration*
///   `}'
/// Instance member declaration parameters must not be marked covariant
///
/// @description Check that instance member declaration parameters must not be
/// marked covariant
/// @author sgrekhov@unipro.ru

class A {}

class C extends A {
}

extension on C {
  addChild(covariant A child) {}
//         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  addChild2(A c, [covariant A child]) {}
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  addChild3(A c, {covariant A child}) {}
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  void set setter (covariant A value) {}
//                 ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  C operator+(covariant A other) => this;
//            ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
}
