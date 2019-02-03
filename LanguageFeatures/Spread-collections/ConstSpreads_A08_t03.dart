/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The existing rules against self-reference prohibit a collection
 * from spreading into itself:
 *   const list = [...list]; // Error.
 * @description: Checks that constant set cannot spread itself
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections

main() {
  const Map map1 = {...map1};  //# 01: compile-time error
  const Map map2 = {...?map2}; //# 02: compile-time error

  const map3 = {...map3};  //# 03: compile-time error
  const map4 = {...?map4}; //# 04: compile-time error
}
