/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set<E> abstract class 
 * Implements Iterable<E>
 * @description All set tests runner
 * @author kaigorodov
 * @author sgrekhov@unipro.ru
 */
library all_set_tests;

import "../../core/Iterable/allTests.lib.dart" as iterable_tests;
import "add_A01_t01.dart" as add_A01_t01;
import "add_A01_t02.dart" as add_A01_t02;
import "add_A01_t03.dart" as add_A01_t03;
import "add_A01_t04.dart" as add_A01_t04;
import "addAll_A01_t01.dart" as addAll_A01_t01;
import "addAll_A01_t02.dart" as addAll_A01_t02;
import "addAll_A01_t03.dart" as addAll_A01_t03;
import "clear_A01_t01.dart" as clear_A01_t01;
import "contains_A01_t01.dart" as contains_A01_t01;
import "contains_A01_t02.dart" as contains_A01_t02;
import "containsAll_A01_t01.dart" as containsAll_A01_t01;
import "containsAll_A01_t02.dart" as containsAll_A01_t02;
import "difference_A01_t01.dart" as difference_A01_t01;
import "every_A01_t01.dart" as every_A01_t01;
import "every_A01_t02.dart" as every_A01_t02;
import "every_A01_t03.dart" as every_A01_t03;
import "forEach_A01_t01.dart" as forEach_A01_t01;
import "forEach_A01_t02.dart" as forEach_A01_t02;
import "forEach_A01_t03.dart" as forEach_A01_t03;
import "forEach_A01_t04.dart" as forEach_A01_t04;
import "forEach_A01_t05.dart" as forEach_A01_t05;
import "intersection_A01_t01.dart" as intersection_A01_t01;
import "intersection_A01_t03.dart" as intersection_A01_t03;
import "intersection_A02_t01.dart" as intersection_A02_t01;
import "intersection_A03_t01.dart" as intersection_A03_t01;
import "isEmpty_A01_t01.dart" as isEmpty_A01_t01;
import "length_A01_t01.dart" as length_A01_t01;
import "lookup_A01_t01.dart" as lookup_A01_t01;
import "remove_A01_t01.dart" as remove_A01_t01;
import "remove_A01_t02.dart" as remove_A01_t02;
import "remove_A01_t03.dart" as remove_A01_t03;
import "remove_A01_t05.dart" as remove_A01_t05;
import "removeAll_A01_t01.dart" as removeAll_A01_t01;
import "removeAll_A01_t02.dart" as removeAll_A01_t02;
import "removeWhere_A01_t01.dart" as removeWhere_A01_t01;
import "retainAll_A01_t01.dart" as retainAll_A01_t01;
import "retainAll_A01_t02.dart" as retainAll_A01_t02;
import "retainWhere_A01_t01.dart" as retainWhere_A01_t01;
import "union_A01_t01.dart" as union_A01_t01;

test(Set create([Iterable content])) {
  iterable_tests.test(create, isSet:true);

  add_A01_t01.test(create);
  add_A01_t02.test(create);
  add_A01_t03.test(create);
  add_A01_t04.test(create);
  addAll_A01_t01.test(create);
  addAll_A01_t02.test(create);
  addAll_A01_t03.test(create);
  clear_A01_t01.test(create);
  contains_A01_t01.test(create);
  contains_A01_t02.test(create);
  containsAll_A01_t01.test(create);
  containsAll_A01_t02.test(create);
  difference_A01_t01.test(create);
  every_A01_t01.test(create);
  every_A01_t02.test(create);
  every_A01_t03.test(create);
  forEach_A01_t01.test(create);
  forEach_A01_t02.test(create);
  forEach_A01_t03.test(create);
  forEach_A01_t04.test(create);
  forEach_A01_t05.test(create);
  intersection_A01_t01.test(create);
  intersection_A01_t03.test(create);
  intersection_A02_t01.test(create);
  intersection_A03_t01.test(create);
  isEmpty_A01_t01.test(create);
  length_A01_t01.test(create);
  lookup_A01_t01.test(create);
  remove_A01_t01.test(create);
  remove_A01_t02.test(create);
  remove_A01_t03.test(create);
  remove_A01_t05.test(create);
  removeAll_A01_t01.test(create);
  removeAll_A01_t02.test(create);
  removeWhere_A01_t01.test(create);
  retainAll_A01_t01.test(create);
  retainAll_A01_t02.test(create);
  retainWhere_A01_t01.test(create);
  union_A01_t01.test(create);
}
