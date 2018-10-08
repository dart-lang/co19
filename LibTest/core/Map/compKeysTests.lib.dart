/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Map<K, V> abstract class 
 * @description Checks that all members of [Map] are implemented, using
 * comparable keys.
 * @author kaigorodov
 */
library compKeysTests;

import "addAll_A01_t01.test.dart" as addAll_A01_t01;
import "clear_A01_t01.test.dart" as clear_A01_t01;
import "containsKey_A01_t01.test.dart" as containsKey_A01_t01;
import "containsValue_A01_t01.test.dart" as containsValue_A01_t01;
import "forEach_A01_t01.test.dart" as forEach_A01_t01;
import "forEach_A01_t04.test.dart" as forEach_A01_t04;
import "forEach_A01_t05.test.dart" as forEach_A01_t05;
import "forEach_A01_t06.test.dart" as forEach_A01_t06;
import "forEach_A01_t08.test.dart" as forEach_A01_t08;
import "forEach_A02_t01.test.dart" as forEach_A02_t01;
import "putIfAbsent_A01_t01.test.dart" as putIfAbsent_A01_t01;
import "putIfAbsent_A01_t06.test.dart" as putIfAbsent_A01_t06;
import "putIfAbsent_A01_t09.test.dart" as putIfAbsent_A01_t09;
import "putIfAbsent_A01_t10.test.dart" as putIfAbsent_A01_t10;

import "isEmpty_A01_t01.test.dart" as isEmpty_A01_t01;
import "isNotEmpty_A01_t01.test.dart" as isNotEmpty_A01_t01;
import "keys_A01_t01.test.dart" as keys_A01_t01;
import "length_A01_t01.test.dart" as length_A01_t01;
import "values_A01_t01.test.dart" as values_A01_t01;
import "operator_subscript_A01_t01.test.dart" as operator_subscript_A01_t01;
import "operator_subscript_A01_t03.test.dart" as operator_subscript_A01_t03;
import "operator_subscripted_assignment_A01_t01.test.dart" as
          operator_subscripted_assignment_A01_t01;

import "remove_A01_t01.test.dart" as remove_A01_t01;

test(Map create([Map content])) {
  addAll_A01_t01.test(create);
  clear_A01_t01.test(create);
  containsKey_A01_t01.test(create);
  containsValue_A01_t01.test(create);
  forEach_A01_t01.test(create);
  forEach_A01_t04.test(create);
  forEach_A01_t05.test(create);
  forEach_A01_t06.test(create);
  forEach_A01_t08.test(create);
  forEach_A02_t01.test(create);
  putIfAbsent_A01_t01.test(create);
  putIfAbsent_A01_t06.test(create);
  putIfAbsent_A01_t09.test(create);
  putIfAbsent_A01_t10.test(create);
  
  isEmpty_A01_t01.test(create);
  isNotEmpty_A01_t01.test(create);
  keys_A01_t01.test(create);
  length_A01_t01.test(create);
  values_A01_t01.test(create);
  operator_subscript_A01_t01.test(create);
  operator_subscript_A01_t03.test(create);
  operator_subscripted_assignment_A01_t01.test(create);
  
  remove_A01_t01.test(create);
}