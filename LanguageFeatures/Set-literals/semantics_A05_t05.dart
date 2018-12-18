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
 * @description Checks that if C is some subclass of Set<X> other than
 * LinkedHashSet, then the literal is a map literal, but it is also a
 * guaranteed type error even if the literal is a set
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=set-literals
import "dart:collection";

main() {
  SplayTreeSet s = {};            //# 01: compile-time error
  SplayTreeSet<int> s = {};       //# 02: compile-time error
  SplayTreeSet<int> s = <int>{};  //# 03: compile-time error
}
