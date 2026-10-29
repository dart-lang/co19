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
/// @description Checks that a single `show` or `hide` combinator still limits
/// the set of imported names.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=single-combinators

import 'single_combinators_lib.dart' show a;
import 'single_combinators_lib.dart' as p hide b;

main() {
  b;
//^
// [analyzer] unspecified
// [cfe] unspecified
  c;
//^
// [analyzer] unspecified
// [cfe] unspecified
  p.b;
//  ^
// [analyzer] unspecified
// [cfe] unspecified
  print(a);
  print(p.a);
}
