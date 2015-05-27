/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool any(bool f(E element))
 * Returns true if one element of the collection satisfies the predicate [f].
 * Returns false otherwise.
 * @description Checks that this method works as specified.
 * @author pagolubev
 * @reviewer msyabro
 */
library allTests_A01_t01;

import "any_A01_t01.test.dart" as any_A01_t01;
import "any_A02_t01.test.dart" as any_A02_t01;
import "first_A01_t01.test.dart" as first_A01_t01;
import "first_A02_t01.test.dart" as first_A02_t01;
import "isEmpty_A01_t01.test.dart" as isEmpty_A01_t01;
import "isNotEmpty_A01_t01.test.dart" as isNotEmpty_A01_t01;
import "iterator_A01_t01.test.dart" as iterator_A01_t01;
import "last_A01_t01.test.dart" as last_A01_t01;
import "last_A02_t01.test.dart" as last_A02_t01;
import "length_A01_t01.test.dart" as length_A01_t01;
import "single_A01_t01.test.dart" as single_A01_t01;
import "contains_A01_t01.test.dart" as contains_A01_t01;

import "where_A01_t01.test.dart" as where_A01_t01;
import "where_A01_t02.test.dart" as where_A01_t02;
import "where_A01_t03.test.dart" as where_A01_t03;
import "where_A01_t04.test.dart" as where_A01_t04;
import "where_A01_t05.test.dart" as where_A01_t05;
import "where_A01_t06.test.dart" as where_A01_t06;
import "where_A01_t07.test.dart" as where_A01_t07;
import "where_A01_t08.test.dart" as where_A01_t08;

test(Iterable create([Iterable content]), {bool isSet:false}) {
  any_A01_t01.test(create);
  any_A02_t01.test(create);
  first_A01_t01.test(create);
  first_A02_t01.test(create);
  isEmpty_A01_t01.test(create);
  isNotEmpty_A01_t01.test(create);
  iterator_A01_t01.test(create, isSet:isSet);
  last_A01_t01.test(create, isSet:isSet);
  last_A02_t01.test(create, isSet:isSet);
  length_A01_t01.test(create, isSet:isSet);
  single_A01_t01.test(create, isSet:isSet);
  contains_A01_t01.test(create);

  where_A01_t01.test(create, isSet:isSet);
  where_A01_t02.test(create, isSet:isSet);
  where_A01_t03.test(create, isSet:isSet);
  where_A01_t04.test(create, isSet:isSet);
  where_A01_t05.test(create, isSet:isSet);
  where_A01_t06.test(create, isSet:isSet);
  where_A01_t07.test(create, isSet:isSet);
  where_A01_t08.test(create, isSet:isSet);
}