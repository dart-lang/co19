// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An import specifies a library to be used in the scope of another
/// library.
/// libraryImport:
///   metadata importSpecification
/// ;
/// importSpecification:
///   import uri (as identifier)? combinator* ‘;’ |
///   import uri deferred as identifier combinator* ‘;’
/// ;
/// combinator:
///   show identifierList |
///   hide identifierList
/// ;
/// identifierList:
///   identifier (, identifier)*
/// ;
/// @description Checks that it is a compile-time error if as clause precedes
/// deferred clause in a deferred import declaration.
/// @author ngl@unipro.ru


import "syntax_lib.dart" as p deferred;
//                            ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  var x = p.foo;
}
