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
// SharedOptions=--enable-experiment=spread-collections,constant-update-2018

main() {
  const x1 = [];
  const Set x2 = {1};
  const Map x3 = {1: 1};
  const x4 = 100;
  const x5 = "check";
  const x6 = null;

  const List l1 = [...?x1];
  const List l2 = [...?x2];
  const List l3 = [...?x3]; //# 01: compile-time error
  const List l4 = [...?x4]; //# 02: compile-time error
  const List l5 = [...?x5]; //# 03: compile-time error
  const List l6 = [...?x6];
}
