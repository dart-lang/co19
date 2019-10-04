/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static error if:
 *    A spread element in a map literal has a static type that is not assignable
 *    to [Map<Object, Object>].
 * @description Checks that compile error is thrown if spread element in map
 * literal is not assignable to [Map<Object, Object>]
 * @author iarkh@unipro.ru
 */

import "dart:collection";

class MyIterable<T> extends IterableBase<T> {
  MyIterator<T> iterator;
  MyIterable() { iterator = new MyIterator(); }
  Iterator getIterator<T>() { return iterator; }
}

class MyIterator<T> extends Iterator<T> {
  @override
  bool moveNext() { return false; }

  @override
  T get current { return null; }
}

main() {
  var number = 1;
  var str = "checkme";
  var list = [1, 2, 3, 4, 5];
  var itr = new MyIterator();

  var m1  = <dynamic, dynamic>{...number};   //# 01: compile-time error
  var m2  = <dynamic, dynamic>{...str};      //# 02: compile-time error
  var m3  = <dynamic, dynamic>{...map};      //# 03: compile-time error
  var m4  = <dynamic, dynamic>{...list[0]};  //# 04: compile-time error
  var m5  = <dynamic, dynamic>{...itr[0]};   //# 05: compile-time error

  var m6  = <dynamic, dynamic>{...?number};  //# 06: compile-time error
  var m7  = <dynamic, dynamic>{...?str};     //# 07: compile-time error
  var m8  = <dynamic, dynamic>{...?map};     //# 08: compile-time error
  var m9  = <dynamic, dynamic>{...?list[0]}; //# 09: compile-time error
  var m10 = <dynamic, dynamic>{...?itr[0]};  //# 10: compile-time error
}
