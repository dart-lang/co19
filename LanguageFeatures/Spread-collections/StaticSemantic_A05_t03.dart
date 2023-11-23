// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a static error if:
///    If a list or set spread element's static type implements [Iterable<T>] for
///    some [T] and [T] is not assignable to the element type of the list.
/// @description Checks that compile error is thrown if spread element type in
/// set literal is not assignable to the type of the set.
/// @author iarkh@unipro.ru

import "dart:collection";

class MyIterable<T> extends IterableBase<T> {
  late MyIterator<T> iterator;
  MyIterable() { iterator = MyIterator(); }
  Iterator getIterator<T>() { return iterator; }
}

class MyIterator<T> implements Iterator<T> {
  @override
  bool moveNext() { return false; }

  @override
  T get current => throw "Should not reach here!";
}

main() {

  List<Object> l1  = <Object> [];
  List<int> l2  = <int>[1, 2, 3];
  List<bool> l3  = <bool>[true, false, true, true];
  List<bool> l4  = <bool>[true, false, true, true];
  List<int> l5  = <int>[];
  List<bool> l6  = <bool>[];
  List<String> l7  = <String>[];
  List<String> l8  = <String>["1", "2"];
  List<Object> l9 = <Object>["1", "2"];

  Iterable<int> i1 = new MyIterable<int>();
  Iterable<String> i2 = new MyIterable<String>();
  Iterable<bool> i3 = new MyIterable<bool>();
  Iterable i4 = new MyIterable<Object>();

  Set list1 = <String>{...l1};
//                        ^^
// [analyzer] COMPILE_TIME_ERROR.SET_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] Can't assign spread elements of type 'Object' to collection elements of type 'String'.
  Set list2 = <String>{...l2};
//                        ^^
// [analyzer] COMPILE_TIME_ERROR.SET_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] Can't assign spread elements of type 'int' to collection elements of type 'String'.
  Set list3 = <Object>{...l3};
  Set list4 = <String>{...l4};
//                        ^^
// [analyzer] COMPILE_TIME_ERROR.SET_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] Can't assign spread elements of type 'bool' to collection elements of type 'String'.
  Set list5 = <String>{...l5};
//                        ^^
// [analyzer] COMPILE_TIME_ERROR.SET_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] Can't assign spread elements of type 'int' to collection elements of type 'String'.
  Set list6 = <String>{...l6};
//                        ^^
// [analyzer] COMPILE_TIME_ERROR.SET_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] Can't assign spread elements of type 'bool' to collection elements of type 'String'.
  Set list7 = <String>{...l7};
  Set list8 = <String>{...l8};
  Set list9 = <String>{...l9};
//                        ^^
// [analyzer] COMPILE_TIME_ERROR.SET_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] Can't assign spread elements of type 'Object' to collection elements of type 'String'.

  Set list11 = <String>{...i1};
//                         ^^
// [analyzer] COMPILE_TIME_ERROR.SET_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] Can't assign spread elements of type 'int' to collection elements of type 'String'.
  Set list12 = <String>{...i2};
  Set list13 = <String>{...i3};
//                         ^^
// [analyzer] COMPILE_TIME_ERROR.SET_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] Can't assign spread elements of type 'bool' to collection elements of type 'String'.
  Set list14 = <String>{...i4};
}
