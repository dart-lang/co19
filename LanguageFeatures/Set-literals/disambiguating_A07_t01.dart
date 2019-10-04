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
 * if e has no typeArguments, no useful context type, and no elements, then e is
 * treated as a map literal with unknown static type. In other words, an
 * empty {} is a map unless we have a context that indicates otherwise
 *
 * @description Checks that an empty {} is a map unless we have a context that
 * indicates otherwise
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  var x = {};
  Expect.isTrue(x is Map);
  Expect.isTrue({} is Map<dynamic, dynamic>);
}
