/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let e be a setOrMapLiteral.
 * If e has a context C, and the base type of C is Cbase (that is, Cbase is C
 * with all wrapping FutureOrs removed), and Cbase is not ?, then let S be the
 * greatest closure.
 * ...
 * If leaf elements has at least one mapEntry and no expressionElement elements,
 * then e is a map literal with unknown static type
 *
 * @description Checks that If leaf elements has at least one mapEntry and no
 * expressionElement elements, then e is a map literal
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  int x = 1;
  var c1 = {if (2 > 1) x: x + 1};
  Expect.isTrue(c1 is Map);

  var c2 = {if (2 > 1) "s": "s" else "$x": ""};
  Expect.isTrue(c2 is Map);

  var c3 = {if (2 > 1) "s": "s" else "$x": "x", if (2 > 1) x: x};
  Expect.isTrue(c3 is Map);

  var c4 = {for (var i = 0; i < 3; i++) if (2 > 1) "s": "s" else if (2 > 1) x: x};
  Expect.isTrue(c4 is Map);

  var c5 = {for (var i in [1, 2, 3]) if (1 > 2) x: x else if (2 > 1) i: i};
  Expect.isTrue(c5 is Map);

  var c6 = {if (1 > 2) for (var i in [1, 2, 3]) i: i
            else if (2 > 1) for (var i = 0; i < 3; i++) i: i};
  Expect.isTrue(c6 is Map);

  var c7 = {if (2 > 1) for (var i in [1, 2, 3]) i: i
            else if (2 > 1) for (var i = 0; i < 3; i++) i: i};
  Expect.isTrue(c7 is Map);
}
