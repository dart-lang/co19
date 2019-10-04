/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let e be a setOrMapLiteral
 * ...
 * If e has typeArguments then:
 *   - If there is exactly one type argument T, then e is a set literal with
 *     static type Set<T>.
 *   - If there are exactly two type arguments K and V, then e is a map literal
 *     with static type Map<K, V>.
 *   - Otherwise (three or more type arguments), report a compile-time error.
 *
 * @description Checks that if s is an emptySetOrMapLiteral and s has a
 * typeArguments with one type argument, then s is a set literal
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  Expect.isTrue(<int> {} is Set);
  Expect.isTrue( const <int> {} is Set);

  var x1 = const <int> {};
  Expect.isTrue( x1 is Set);
  var x2 = <int> {};
  Expect.isTrue( x2 is Set);
}
