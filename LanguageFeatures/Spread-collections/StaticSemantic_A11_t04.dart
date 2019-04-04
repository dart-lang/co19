/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if:
 * A spread element in a map literal has a static type that is not [dynamic] and
 * not a subtype of [Map<Object, Object>].
 * @description Checks that compile error is thrown if null-aware spread element
 * in the constant map is not assignable to [Map] and is not [Null]
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

  const Map m1  = {...?x1}; //# 01: compile-time error
  const Map m2  = {...?x2}; //# 02: compile-time error
  const Map m3  = {...?x3};
  const Map m4  = {...?x4}; //# 03: compile-time error
  const Map m5  = {...?x5}; //# 04: compile-time error
  const Map m6  = {...?x6};
}
