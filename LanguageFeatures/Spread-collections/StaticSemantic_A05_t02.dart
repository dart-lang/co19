/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static error if:
 *    If a list or set spread element's static type implements [Iterable<T>] for
 *    some [T] and [T] is not assignable to the element type of the list.
 * @description Checks that compile error is thrown if spread element type in
 * the list literal is not assignable to the type of the list.
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
  List<int> l1  = <int>[1, 2, 3];
  List<bool> l2  = <bool>[true, false, true, true];
  List<int> l3  = <int>[];
  List<bool> l4  = <bool>[];

  Iterable<int> i1 = new MyIterable<int>();
  Iterable<bool> i2 = new MyIterable<bool>();

  List list1  = <String>[...l1];  //# 01: compile-time error
  List list2  = <String>[...l2];  //# 02: compile-time error
  List list3  = <String>[...l3];  //# 03: compile-time error
  List list4  = <String>[...l4];  //# 04: compile-time error
  List list5  = <String>[...i1];  //# 05: compile-time error
  List list6  = <String>[...i2];  //# 06: compile-time error

  List list7  = <String>[...?l1]; //# 07: compile-time error
  List list8  = <String>[...?l2]; //# 08: compile-time error
  List list9  = <String>[...?l3]; //# 09: compile-time error
  List list10 = <String>[...?l4]; //# 10: compile-time error
  List list11 = <String>[...?i1]; //# 11: compile-time error
  List list12 = <String>[...?i2]; //# 12: compile-time error
}
