/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If s is an emptySetOrMapLiteral with no typeArguments and static
 * context type C, then if Set<Null> is assignable to C and Map<Null, Null> is
 * not assignable to C, then s is a set literal, otherwise s is a map literal.
 *
 * @description Checks that if s is an emptySetOrMapLiteral with no
 * typeArguments and static context type C, then if Set<Null> is not assignable
 * to C or Map<Null, Null> is assignable to C, then s is a map literal
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

Object test() => {};

main() {
  Expect.isTrue(test() is Map);
}
