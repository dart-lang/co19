/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If s is an emptySetOrMapLiteral with no typeArguments and static
 * context type C, then if LinkedHashSet<Null> is assignable to C and
 * LinkedHashMap<Null, Null> is not assignable to C, then s is a set literal,
 * otherwise s is a map literal.
 *
 * @description Checks that if s is an emptySetOrMapLiteral with no
 * typeArguments and static context type C, then if LinkedHashSet<Null> is not
 * assignable to C or LinkedHashMap<Null, Null> is assignable to C, then s is a
 * map literal
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=set-literals
import "dart:async";
import "../../Utils/expect.dart";

dynamic test() => {};
Map<int, String> test2() => {};
FutureOr<Map> test3() => {};

main() {
  Expect.isTrue(test() is Map);
  Expect.isTrue(test2() is Map);
  Expect.isTrue(test3() is Map);
}
