// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The grammar for import and export directives is modified to
/// allow at most one combinator:
/// ```
/// <importDirective> ::=
///     <metadata> `import' <configurableUri> (`deferred'? `as' <typeIdentifier>)?
///     <combinator>? `;'
///
/// <exportDirective> ::=
///     <metadata> `export' <configurableUri> <combinator>? `;'
/// ```
/// When the `single-combinators` experiment is enabled, having more than one
/// combinator (`show` or `hide`) on an `import` or `export` directive is a
/// compile-time error (`multipleCombinators`).
///
/// @description Checks that it is a compile-time error if an import directive
/// has three or more combinators.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=single-combinators

import 'single_combinators_lib.dart' show a, b show a hide b;
//                                             ^^^^
// [analyzer] unspecified
// [cfe] unspecified

import 'single_combinators_lib.dart' as p hide a hide b hide c;
//                                               ^^^^
// [analyzer] unspecified
// [cfe] unspecified


main() {}
