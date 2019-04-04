/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if:
 * A spread element in a list or set literal has a static type that is not
 * dynamic and not a subtype of Iterable<Object>.
 * @description Checks that compile error is thrown if spread element in the
 * constant set is not dynamic and is not assignable to [Iterable]
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

  const Set s1 = {...x1};
  const Set s2 = {...x2};
  const Set s3 = {...x3}; //# 01: compile-time error
  const Set s4 = {...x4}; //# 02: compile-time error
  const Set s5 = {...x5}; //# 03: compile-time error
  const Set s6 = {...x6}; //# 04: compile-time error
}
