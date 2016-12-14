/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> abstract class 
 * @description Checks that List-specific methods work as specified.
 * @author kaigorodov
 */
library allListTests;

import "add_A01_t01.test.dart" as add_A01_t01;
import "add_A01_t02.test.dart" as add_A01_t02;
import "add_A02_t01.test.dart" as add_A02_t01;
import "addAll_A01_t01.test.dart" as addAll_A01_t01;
import "addAll_A01_t02.test.dart" as addAll_A01_t02;
import "addAll_A02_t01.test.dart" as addAll_A02_t01;
import "addAll_A02_t02.test.dart" as addAll_A02_t02;
import "asMap_A01_t01.test.dart" as asMap_A01_t01;
import "asMap_A02_t01.test.dart" as asMap_A02_t01;
import "clear_A01_t01.test.dart" as clear_A01_t01;
import "clear_A02_t01.test.dart" as clear_A02_t01;
import "fillRange_A01_t01.test.dart" as fillRange_A01_t01;
import "fillRange_A02_t01.test.dart" as fillRange_A02_t01;
import "getRange_A01_t01.test.dart" as getRange_A01_t01;
import "getRange_A01_t02.test.dart" as getRange_A01_t02;
import "getRange_A02_t01.test.dart" as getRange_A02_t01;
import "getRange_A03_t01.test.dart" as getRange_A03_t01;
import "indexOf_A01_t01.test.dart" as indexOf_A01_t01;
import "indexOf_A02_t01.test.dart" as indexOf_A02_t01;
import "indexOf_A03_t01.test.dart" as indexOf_A03_t01;
import "indexOf_A04_t01.test.dart" as indexOf_A04_t01;
import "indexOf_A05_t01.test.dart" as indexOf_A05_t01;
import "insert_A01_t01.test.dart" as insert_A01_t01;
import "insert_A02_t01.test.dart" as insert_A02_t01;
import "insertAll_A01_t01.test.dart" as insertAll_A01_t01;
import "insertAll_A02_t01.test.dart" as insertAll_A02_t01;
import "iterator_current_A01_t01.test.dart" as iterator_current_A01_t01;
import "iterator_moveNext_A01_t01.test.dart" as iterator_moveNext_A01_t01;
import "lastIndexOf_A01_t01.test.dart" as lastIndexOf_A01_t01;
import "lastIndexOf_A02_t01.test.dart" as lastIndexOf_A02_t01;
import "lastIndexOf_A03_t01.test.dart" as lastIndexOf_A03_t01;
import "lastIndexOf_A04_t01.test.dart" as lastIndexOf_A04_t01;
import "lastIndexOf_A05_t01.test.dart" as lastIndexOf_A05_t01;
import "length_A01_t01.test.dart" as length_A01_t01;
import "length_A02_t01.test.dart" as length_A02_t01;
import "length_A03_t01.test.dart" as length_A03_t01;
import "length_A04_t01.test.dart" as length_A04_t01;
import "length_A05_t01.test.dart" as length_A05_t01;
import "length_A06_t01.test.dart" as length_A06_t01;
import "operator_subscript_A01_t01.test.dart" as operator_subscript_A01_t01;
import "operator_subscript_A01_t02.test.dart" as operator_subscript_A01_t02;
import "operator_subscript_A02_t01.test.dart" as operator_subscript_A02_t01;
import "operator_subscript_A03_t01.test.dart" as operator_subscript_A03_t01;
import "operator_subscript_A04_t01.test.dart" as operator_subscript_A04_t01;
import "operator_subscripted_assignment_A01_t01.test.dart" as operator_subscripted_assignment_A01_t01;
import "operator_subscripted_assignment_A01_t02.test.dart" as operator_subscripted_assignment_A01_t02;
import "operator_subscripted_assignment_A02_t01.test.dart" as operator_subscripted_assignment_A02_t01;
import "operator_subscripted_assignment_A03_t01.test.dart" as operator_subscripted_assignment_A03_t01;
import "remove_A01_t01.test.dart" as remove_A01_t01;
import "removeAt_A01_t01.test.dart" as removeAt_A01_t01;
import "removeAt_A02_t01.test.dart" as removeAt_A02_t01;
import "removeAt_A03_t01.test.dart" as removeAt_A03_t01;
import "removeAt_A04_t01.test.dart" as removeAt_A04_t01;
import "removeLast_A01_t01.test.dart" as removeLast_A01_t01;
import "removeLast_A02_t01.test.dart" as removeLast_A02_t01;
import "removeLast_A02_t01.test.dart" as removeLast_A03_t01;
import "removeRange_A01_t01.test.dart" as removeRange_A01_t01;
import "removeRange_A01_t02.test.dart" as removeRange_A01_t02;
import "removeRange_A02_t01.test.dart" as removeRange_A02_t01;
import "removeRange_A03_t01.test.dart" as removeRange_A03_t01;
import "removeRange_A03_t02.test.dart" as removeRange_A03_t02;
import "removeRange_A03_t03.test.dart" as removeRange_A03_t03;
import "removeWhere_A01_t01.test.dart" as removeWhere_A01_t01;
import "replaceRange_A01_t01.test.dart" as replaceRange_A01_t01;
import "replaceRange_A01_t02.test.dart" as replaceRange_A01_t02;
import "retainWhere_A01_t01.test.dart" as retainWhere_A01_t01;
import "setAll_A01_t01.test.dart" as setAll_A01_t01;
import "setAll_A02_t01.test.dart" as setAll_A02_t01;
import "setAll_A03_t01.test.dart" as setAll_A03_t01;
import "setAll_A04_t01.test.dart" as setAll_A04_t01;
import "setAll_A05_t01.test.dart" as setAll_A05_t01;
import "reversed_A01_t01.test.dart" as reversed_A01_t01;
import "setRange_A01_t01.test.dart" as setRange_A01_t01;
import "setRange_A01_t02.test.dart" as setRange_A01_t02;
import "setRange_A02_t01.test.dart" as setRange_A02_t01;
import "setRange_A02_t02.test.dart" as setRange_A02_t02;
import "shuffle_A01_t01.test.dart" as shuffle_A01_t01;
import "shuffle_A01_t02.test.dart" as shuffle_A01_t02;
import "shuffle_A01_t03.test.dart" as shuffle_A01_t03;
import "sort_A01_t01.test.dart" as sort_A01_t01;
import "sort_A01_t02.test.dart" as sort_A01_t02;
import "sort_A01_t03.test.dart" as sort_A01_t03;
/* consume too much memory, moved to separate test List_class_A01_t02.dart
import "sort_A01_t04.test.dart" as sort_A01_t04;
import "sort_A01_t05.test.dart" as sort_A01_t05;
import "sort_A01_t06.test.dart" as sort_A01_t06;
*/

import "sublist_A01_t01.test.dart" as sublist_A01_t01;
import "sublist_A02_t01.test.dart" as sublist_A02_t01;
import "sublist_A03_t01.test.dart" as sublist_A03_t01;

import "../../core/Iterable/allTests.lib.dart" as iterableTests;

test(List create([int length])) {
  add_A01_t01.test(create);
  add_A01_t02.test(create);
  add_A02_t01.test(create);
  addAll_A01_t01.test(create);
  addAll_A01_t02.test(create);
  addAll_A02_t01.test(create);
  addAll_A02_t02.test(create);
  asMap_A01_t01.test(create);
  asMap_A02_t01.test(create);
  clear_A01_t01.test(create);
  clear_A02_t01.test(create);
  fillRange_A01_t01.test(create);
  fillRange_A02_t01.test(create);
  getRange_A01_t01.test(create);
  getRange_A01_t02.test(create);
  getRange_A02_t01.test(create);
  getRange_A03_t01.test(create);
  insert_A01_t01.test(create);
  insert_A02_t01.test(create);
  insertAll_A01_t01.test(create);
  insertAll_A02_t01.test(create);
  iterator_current_A01_t01.test(create);
  iterator_moveNext_A01_t01.test(create);
  indexOf_A01_t01.test(create);
  indexOf_A02_t01.test(create);
  indexOf_A03_t01.test(create);
  indexOf_A04_t01.test(create);
  indexOf_A05_t01.test(create);
  lastIndexOf_A01_t01.test(create);
  lastIndexOf_A02_t01.test(create);
  lastIndexOf_A03_t01.test(create);
  lastIndexOf_A04_t01.test(create);
  lastIndexOf_A05_t01.test(create);
  length_A01_t01.test(create);
  length_A02_t01.test(create);
  length_A03_t01.test(create);
  length_A04_t01.test(create);
  length_A05_t01.test(create);
  length_A06_t01.test(create);
  operator_subscript_A01_t01.test(create);
  operator_subscript_A01_t02.test(create);
  operator_subscript_A02_t01.test(create);
  operator_subscript_A03_t01.test(create);
  operator_subscript_A04_t01.test(create);
  operator_subscripted_assignment_A01_t01.test(create);
  operator_subscripted_assignment_A01_t02.test(create);
  operator_subscripted_assignment_A02_t01.test(create);
  operator_subscripted_assignment_A03_t01.test(create);
  remove_A01_t01.test(create);
  removeAt_A01_t01.test(create);
  removeAt_A01_t01.test(create);
  removeAt_A02_t01.test(create);
  removeAt_A03_t01.test(create);
  removeAt_A04_t01.test(create);
  removeLast_A01_t01.test(create);
  removeLast_A02_t01.test(create);
  removeLast_A03_t01.test(create);
  removeRange_A01_t01.test(create);
  removeRange_A01_t02.test(create);
  removeRange_A02_t01.test(create);
  removeRange_A03_t01.test(create);
  removeRange_A03_t02.test(create);
  removeRange_A03_t03.test(create);
  removeWhere_A01_t01.test(create);
  replaceRange_A01_t01.test(create);
  replaceRange_A01_t02.test(create);
  retainWhere_A01_t01.test(create);
  reversed_A01_t01.test(create);
  setAll_A01_t01.test(create);
  setAll_A02_t01.test(create);
  setAll_A03_t01.test(create);
  setAll_A04_t01.test(create);
  setAll_A05_t01.test(create);
  setRange_A01_t01.test(create);
  setRange_A01_t02.test(create);
  setRange_A02_t01.test(create);
  setRange_A02_t02.test(create);
  shuffle_A01_t01.test(create);
  shuffle_A01_t02.test(create);
  shuffle_A01_t03.test(create);
  sort_A01_t01.test(create);
  sort_A01_t02.test(create);
  sort_A01_t03.test(create);
  /* consume too much memory, moved to separate test List_class_A01_t02.dart
  sort_A01_t04.test(create);  
  sort_A01_t05.test(create);  
  sort_A01_t06.test(create);
  */
  sublist_A01_t01.test(create);
  sublist_A02_t01.test(create);
  sublist_A03_t01.test(create);

  // Run tests for methods inherited from Iterable
  Iterable createIterable([Iterable content]) {
    if (content == null) {
      return create();
    } else {
      List l = create();
      l.addAll(content);
      return l;
    }
  }
  iterableTests.test(createIterable);
}
