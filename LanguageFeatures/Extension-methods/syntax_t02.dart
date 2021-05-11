// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion an extension declaration is a top-level declaration with a grammar
/// similar to:
/// <extension> ::=
///   `extension' <identifier>? <typeParameters>? `on' <type> `?'? `{'
///     memberDeclaration*
///   `}'
/// Such a declaration introduces its name (the identifier) into the surrounding
/// scope
///
/// @description Check that it is compile-error if extension declaration is not
/// top-level
/// @author sgrekhov@unipro.ru



class C {
  extension MyFancyList<T> on List<T> {
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    int get doubleLength => this.length * 2;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  extension MyFancyList<T> on List<T> {
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    int get doubleLength => this.length * 2;
//      ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
//^
// [analyzer] SYNTACTIC_ERROR.EXPECTED_TOKEN
// [cfe] Expected ';' after this.
}
