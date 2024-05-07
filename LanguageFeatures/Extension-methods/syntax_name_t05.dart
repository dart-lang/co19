// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion an extension declaration is a top-level declaration with a
/// grammar similar to:
/// <extension> ::=
///   `extension' <identifier>? <typeParameters>? `on' <type> `?'? `{'
///     memberDeclaration*
///   `}'
/// Such a declaration introduces its name (the identifier) into the surrounding
/// scope. The name does not denote a type, but it can be used to denote the
/// extension itself in various places. The name can be hidden or shown in
/// import export declarations.
///
/// @description Check that it is a compile-time error to create a type alias
/// for an extension
/// @author sgrekhov22@gmail.com

class A {}
extension Ext on A {}

typedef ExtAlias = Ext;
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(A);
}
