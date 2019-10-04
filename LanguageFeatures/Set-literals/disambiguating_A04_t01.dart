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
 * If leaf elements has at least one expressionElement and no mapEntry elements,
 * then e is a set literal with unknown static type
 *
 * @description Checks that if leaf elements has at least one expressionElement
 * and no mapEntry elements, then e is a set literal
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  int x = 1;
  var c1 = {if (2 > 1) x + 1};
  Expect.isTrue(c1 is Set);

  var c2 = {if (2 > 1) "s" else "$x"};
  Expect.isTrue(c2 is Set);

  var c3 = {if (2 > 1) "s" else "$x", if (2 > 1) x};
  Expect.isTrue(c3 is Set);

  var c4 = {for (var i = 0; i < 3; i++) if (2 > 1) "s" else if (2 > 1) x};
  Expect.isTrue(c4 is Set);

  var c5 = {for (var i in [1, 2, 3]) if (1 > 2) x else if (2 > 1) i};
  Expect.isTrue(c5 is Set);

  var c6 = {if (1 > 2) for (var i in [1, 2, 3]) i
            else if (2 > 1) for (var i = 0; i < 3; i++) i};
  Expect.isTrue(c6 is Set);

  var c7 = {if (2 > 1) for (var i in [1, 2, 3]) i
            else if (2 > 1) for (var i = 0; i < 3; i++) i};
  Expect.isTrue(c7 is Set);
}
