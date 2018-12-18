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
 * typeArguments and static context type C, then if LinkedHashSet<Null> is
 * assignable to C and LinkedHashMap<Null, Null> is not assignable to C, then s
 * is a set literal
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=set-literals
import "dart:collection";
import "../../Utils/expect.dart";

dynamic forgetType(dynamic x) => x;

class C<T>  {
  T t = forgetType({});
}

main() {
  Expect.isTrue(new C<LinkedHashSet<Null>>().t is Set);
}
