// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a static error if:
///    If a list or set spread element's static type implements [Iterable<T>] for
///    some [T] and [T] is not assignable to the element type of the list.
/// @description Checks that compile error is thrown if spread element type in
/// the list literal is not assignable to the type of the list.
/// @author iarkh@unipro.ru

import "dart:collection";

class MyIterable<T> extends IterableBase<T> {
  late MyIterator<T> iterator;
  MyIterable() { iterator = new MyIterator(); }
  Iterator getIterator<T>() { return iterator; }
}

class MyIterator<T> implements Iterator<T> {
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
  List<int> l1  = <int>[1, 2, 3];
  List<bool> l2  = <bool>[true, false, true, true];
  List<int> l3  = <int>[];
  List<bool> l4  = <bool>[];

  Iterable<int> i1 = new MyIterable<int>();
  Iterable<bool> i2 = new MyIterable<bool>();

  List list1  = <String>[...l1];
//                          ^^
// [analyzer] COMPILE_TIME_ERROR.LIST_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] Can't assign spread elements of type 'int' to collection elements of type 'String'.
  List list2  = <String>[...l2];
//                          ^^
// [analyzer] COMPILE_TIME_ERROR.LIST_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] Can't assign spread elements of type 'bool' to collection elements of type 'String'.
  List list3  = <String>[...l3];
//                          ^^
// [analyzer] COMPILE_TIME_ERROR.LIST_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] Can't assign spread elements of type 'int' to collection elements of type 'String'.
  List list4  = <String>[...l4];
//                          ^^
// [analyzer] COMPILE_TIME_ERROR.LIST_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] Can't assign spread elements of type 'bool' to collection elements of type 'String'.
  List list5  = <String>[...i1];
//                          ^^
// [analyzer] COMPILE_TIME_ERROR.LIST_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] Can't assign spread elements of type 'int' to collection elements of type 'String'.
  List list6  = <String>[...i2];
//                          ^^
// [analyzer] COMPILE_TIME_ERROR.LIST_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] Can't assign spread elements of type 'bool' to collection elements of type 'String'.
}

void test2() {
  List<int>? l1  = <int>[1, 2, 3];
  List<bool>? l2  = <bool>[true, false, true, true];
  List<int>? l3  = <int>[];
  List<bool>? l4  = <bool>[];

  Iterable<int>? i1 = new MyIterable<int>();
  Iterable<bool>? i2 = new MyIterable<bool>();

  List list7  = <String>[...?l1];
//                           ^^
// [analyzer] unspecified
// [cfe] unspecified
  List list8  = <String>[...?l2];
//                           ^^
// [analyzer] unspecified
// [cfe] unspecified
  List list9  = <String>[...?l3];
//                           ^^
// [analyzer] unspecified
// [cfe] unspecified
  List list10 = <String>[...?l4];
//                           ^^
// [analyzer] unspecified
// [cfe] unspecified
  List list11 = <String>[...?i1];
//                           ^^
// [analyzer] unspecified
// [cfe] unspecified
  List list12 = <String>[...?i2];
//                           ^^
// [analyzer] unspecified
// [cfe] unspecified
}
