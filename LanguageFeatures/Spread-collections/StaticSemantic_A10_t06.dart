/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if:
 * A spread element in a list or set literal has a static type that is not
 * dynamic and not a subtype of Iterable<Object>.
 * @description Checks that compile error is thrown if null-aware spread element
 * in the constant list is not assignable to [Iterable] and is not [Null]
 * @author iarkh@unipro.ru
 */

main() {
  const Map x1 = {1: 1};
  const x2 = 100;
  const x3 = "check";

  const List l1 = [...?x1]; //# 01: compile-time error
  const List l2 = [...?x2]; //# 02: compile-time error
  const List l3 = [...?x3]; //# 03: compile-time error
}
