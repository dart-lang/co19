/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static error if:
 *    If a list or set spread element's static type implements [Iterable<T>] for
 *    some [T] and [T] is not assignable to the element type of the list.
 * @description Checks that compile error is not thrown if spread element type
 * in the list literal is assignable to the type of the list.
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

  List<Object> l1  = <Object> [];
  List<bool> l2  = <bool>[true, false, true, true];
  List<String> l3  = <String>[];
  List<String> l4  = <String>["1", "2"];
  List l5 = <Object>["1", "2"];

  Iterable<String> i1 = new MyIterable<String>();
  Iterable i2 = new MyIterable<Object>();

  List list1 = <String>[...l1];
  List list2 = <Object>[...l2];
  List list3 = <String>[...l3];
  List list4 = <String>[...l4];
  List list5 = <String>[...l5];

  List list16 = <String>[...i1];
  List list17 = <String>[...i2];

  List list8 = <String>[...?l1];
  List list9 = <Object>[...?l2];
  List list10 = <String>[...?l3];
  List list11 = <String>[...?l4];
  List list12 = <String>[...?l5];

  List list13 = <String>[...?i1];
  List list14 = <String>[...?i2];

}
