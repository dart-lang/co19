// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that `partDirective`, `partHeader` and `libraryName` may
/// contain metadata.
/// @author sgrekhov22@gmail.com

@Annot1()
part of 'syntax_t09.dart';

String bar = "bar";
