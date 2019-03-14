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
// SharedOptions=--enable-experiment=spread-collections

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
  int number = 1;
  String str = "checkme";
  List list = [1, 2, 3, 4, 5];
  Iterator itr = new MyIterator();

  Map m1 = {...number};  //# 01: compile-time error
  Map m2 = {...str};     //# 02: compile-time error
  Map m3 = {...map};     //# 03: compile-time error
  Map m4 = {...list[0]}; //# 04: compile-time error
  Map m5 = {...itr[0]};  //# 05: compile-time error
}
