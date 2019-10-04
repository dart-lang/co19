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
 * expressionElement elements, then e is a map literal. Test spread collections
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  var x = {1: "1", 2: "2", 3: "3"};
  var y = {"1": "Let", "2": "it", "3": "be"};

  var c1 = {if (2 > 1) ...x};
  Expect.isTrue(c1 is Map);

  var c2 = {if (2 > 1) ...x else ...y};
  Expect.isTrue(c2 is Map);

  var c3 = {if (2 > 1) ...y else ...x, if (2 > 1) ...x};
  Expect.isTrue(c3 is Map);

  var c4 = {for (var i = 0; i < 3; i++) if (2 > 1) ...y else if (2 > 1) ...x};
  Expect.isTrue(c4 is Map);

  var c5 = {for (var i in [1, 2, 3]) if (1 > 2) ...x else if (2 > 1) ...y};
  Expect.isTrue(c5 is Map);

  var c6 = {if (1 > 2) for (var i in [1, 2, 3]) ...y
            else if (2 > 1) for (var i = 0; i < 3; i++) ...x};
  Expect.isTrue(c6 is Map);

  var c7 = {if (2 > 1) for (var i in [1, 2, 3]) ...x
            else if (2 > 1) for (var i = 0; i < 3; i++) ...y};
  Expect.isTrue(c7 is Map);
}
