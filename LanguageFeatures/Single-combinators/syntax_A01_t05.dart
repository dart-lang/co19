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
/// @description Checks that it is not an error if an export directive has zero
/// or one combinator.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=single-combinators

import '../../Utils/expect.dart';
import 'syntax_A01_t05_lib.dart';

main() async {
  Expect.equals('a', a);
  Expect.equals('c', c());
  Expect.equals('D', D().id);
  Expect.equals(2, max(1, 2));
  Expect.equals(1, await Future.value(1));
}
