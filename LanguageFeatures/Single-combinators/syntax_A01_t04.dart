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
/// @description Checks that it is not an error if an import directive has
/// zero or one combinator.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=single-combinators

import '../../Utils/expect.dart';
import 'single_combinators_lib.dart' show a, D;
import 'single_combinators_lib.dart' hide a, D;
import 'single_combinators_lib.dart' as p1;
import 'single_combinators_lib.dart' as p2 show b;
import 'single_combinators_lib.dart' as p3 hide b;
import 'single_combinators_lib.dart' deferred as p4;
import 'single_combinators_lib.dart' deferred as p5 show c;
import 'single_combinators_lib.dart' deferred as p6 hide c;

main() async {
  Expect.equals('a', a);
  Expect.equals('D', D().id);
  Expect.equals('b', b);
  Expect.equals('c', c());
  Expect.equals('a', p1.a);
  Expect.equals('b', p2.b);
  Expect.equals('c', p3.c());
  await p4.loadLibrary();
  Expect.equals('D', p4.D().id);
  await p5.loadLibrary();
  Expect.equals('c', p5.c());
  await p6.loadLibrary();
  Expect.equals('a', p6.a);
}
