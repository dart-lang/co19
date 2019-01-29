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
 * list literal is not assignable to the type of the list.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=spread-collections

import "dart:collection";

class MyIterable<T> extends IterableBase<T> {
  MyIterator<T> iterator;

  MyIterable() {
    iterator = new MyIterator();
  }

  Iterator getIterator<T>() {
    return iterator;
  }
}

class MyIterator<T> extends Iterator<T> {
   @override
  bool moveNext() {
    return false;
  }

  @override
  T get current {
    return null;
  }
}

main() {

  List l1  = <Object> [1, 2, 3];
  List l2  = <int>[1, 2, 3];
  List l3  = <Object>[true, false, true, true];
  List l4  = <bool>[true, false, true, true];
  List l5  = <Object>[];
  List l6  = <int>[];
  List l7  = <bool>[];
  List l8  = <String>[];
  List l9  = <String>["1", "2"];
  List l10 = <Object>["1", "2"];

  Iterable i1 = new MyIterable<int>();
  Iterable i2 = new MyIterable<String>();
  Iterable i3 = new MyIterable<bool>();
  Iterable i4 = new MyIterable<Object>();

  List list1  = <String>[...l1]; //# 01: compile-time error
  List list2  = <String>[...l2]; //# 02: compile-time error
  List list3  = <String>[...l3]; //# 03: compile-time error
  List list4  = <String>[...l4]; //# 04; compile-time error
  List list5  = <String>[...l5];
  List list6  = <String>[...l6]; //# 05: compile-time error
  List list7  = <String>[...l7]; //# 06: compile-time error
  List list8  = <String>[...l8]; //# 07: compile-time error
  List list9  = <String>[...l9];
  List list10 = <String>[...l10];

  List list11 = <String>[...i1]; //# 08: compile-time error
  List list12 = <String>[...i2];
  List list13 = <String>[...i3]; //# 09: compile-time error
  List list14 = <String>[...i4];
}
