/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static error if:
 *    A spread element in a list or set literal has a static type that is not
 *    assignable to Iterable<Object>.
 * @description Checks that compile error is thrown if spread element in set
 * literal is not assignable to [Iterate<Object>]
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections

main() {
  int number = 1;
  String str = "checkme";
  Map map = {1: 1, 2: 2};
  List list = [1, 2, 3, 4, 5];

  Set l1 = {...number};  //# 01: compile-time error
  Set l2 = {...str};     //# 02: compile-time error
  Set l3 = {...map};     //# 03: compile-time error
  Set l4 = {...list[0]}; //# 04: compile-time error
}
