// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A library may be divided into parts, each of which can be stored
/// in a separate location. A library identifies its parts by listing them via
/// part directives.
/// A part directive specifies a URI where a Dart compilation unit that should
/// be incorporated into the current library may be found.
///
/// <partDirective> ::= <metadata> `part' <configurableUri> `;'
/// <partHeader> ::= <metadata> `part' `of' <uri> `;'
/// <partDeclaration> ::=
///   <partHeader> <importOrExport>* <partDirective>*
///   (<metadata> <topLevelDeclaration>)* <EOF>
///
/// @description Checks that it is a compile-time error when the part's URI is
/// not enclosed in quotes.
/// @author rodionov

part syntax_t03_part.dart
//   ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
