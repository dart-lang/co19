// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We extend the grammar of part files to allow `import`, `export`
/// and `part` file directives. We restrict the part of directive to only allow
/// the string version.
///
/// -- Removed "<dottedIdentifier>" as option, retaining only "<uri>".
/// <partHeader> ::= <metadata> `part' `of' <uri> `;'
///
/// -- Added "<importOrExport>* <partDirective>*"
/// <partDeclaration> ::=
///   <partHeader> <importOrExport>* <partDirective>* (<metadata>
///   <topLevelDeclaration>)* <EOF>
///
/// The grammar change is small, mainly adding `import`, `export` and `part`
/// directives to part files.
///
/// @description Checks that it is a compile-time error if a part file contains
/// a normal library directive.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

library grammar_A05_t02;
part 'grammar_A05_t02_lib.dart';
//   ^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified

main() {
}
