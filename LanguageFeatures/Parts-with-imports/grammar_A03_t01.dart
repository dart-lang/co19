// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We extend the grammar of part files to allow import, export and
/// part file directives. We allow part files directives to use a configurable
/// URI like the other two. We restrict the part of directive to only allow the
/// string version.
///
/// -- Changed "<uri>" to "<configurableUri>".
/// <partDirective> ::= <metadata> `part' <configurableUri> `;'
///
/// -- Removed "<dottedIdentifier>" as option, retaining only "<uri>".
/// <partHeader> ::= <metadata> `part' `of' <uri> `;'
///
/// -- Added "<importOrExport>* <partDirective>*"
/// <partDeclaration> ::=
///   <partHeader> <importOrExport>* <partDirective>*
///   (<metadata> <topLevelDeclaration>)* <EOF>
///
/// The grammar change is small, mainly adding import, export and part
/// directives to part files.
///
/// @description Check that it is a compile-time error to use a
/// <dottedIdentifier> in a `part of` directive.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

library grammar.a03.t01;
part 'grammar_A03_t01_part1.dart';
//    ^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
}
