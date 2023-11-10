// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
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
/// @description Check that it is a compile-time error if an extension has the
/// name `type`. Test record type
/// @author sgrekhov22@gmail.com

extension type on (int i,) {}
//                      ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print((int,));
}
