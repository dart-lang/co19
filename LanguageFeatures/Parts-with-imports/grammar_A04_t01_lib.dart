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
/// @description Check that it is a compile-time error to use more than one
/// <partHeader>.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

part 'grammar_A04_t01_part1.dart';
//   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
