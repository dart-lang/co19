/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let e be a setOrMapLiteral.
 * If e has a context C, and the base type of C is Cbase (that is, Cbase is C
 * with all wrapping FutureOrs removed), and Cbase is not ?, then let S be the
 * greatest closure.
 * ...
 * if S is defined and is a subtype of Iterable<Object> and S is not a subtype
 * of Map<Object, Object>, then e is a set literal.
 *
 * @description Checks that if s is an emptySetOrMapLiteral with no
 * typeArguments and static context type C, then if S is a subtype of
 * Iterable<Object> and S is not a subtype of Map<Object, Object>, then e is a
 * set literal
 * @author sgrekhov@unipro.ru
 */
import "dart:async";
import "../../Utils/expect.dart";

Set<Object> test() => {};
Iterable<int> test2() => {};
FutureOr<Iterable<int>> test3() => {};
Set<int> test4() => {};

main() {
  Expect.isTrue(test() is Set);
  Expect.isTrue(test2() is Set);
  Expect.isTrue(test3() is Set);
  Expect.isTrue(test4() is Set);

  Iterable<Object> o = {};
  Expect.isTrue(o is Set);
}
