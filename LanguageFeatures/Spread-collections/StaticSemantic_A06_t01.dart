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
  late MyIterator<T> iterator;
  MyIterable() { iterator = MyIterator(); }
  Iterator getIterator<T>() => iterator;
}

class MyIterator<T> extends Iterator<T> {
  @override
  bool moveNext() { return false; }

  @override
  T get current => throw "Should not reach here!";
}

main() {
  test1();
  test2();
}

void test1() {
  var number = 1;
  var str = "checkme";
  var list = [1, 2, 3, 4, 5];
  var itr = new MyIterator();

  var m1  = <dynamic, dynamic>{...number};   //# 01: compile-time error
  var m2  = <dynamic, dynamic>{...str};      //# 02: compile-time error
  var m3  = <dynamic, dynamic>{...list[0]};  //# 03: compile-time error
  var m4  = <dynamic, dynamic>{...itr[0]};   //# 04: compile-time error
}

void test2() {
  int? number = 1;
  String? str = "checkme";
  List? list = [1, 2, 3, 4, 5];
  Iterator? itr = new MyIterator();

  var m5  = <dynamic, dynamic>{...?number};  //# 05: compile-time error
  var m6  = <dynamic, dynamic>{...?str};     //# 06: compile-time error
  var m7  = <dynamic, dynamic>{...?list[0]}; //# 07: compile-time error
  var m8 = <dynamic, dynamic>{...?itr[0]};   //# 8: compile-time error
}
