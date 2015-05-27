/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> abstract class 
 * @description Checks that List-specific methods work as specified.
 * tests which consume much memory 
 * @author kaigorodov
 */
library hugeListTests;

import "sort_A01_t01.test.dart" as sort_A01_t01;
import "sort_A01_t02.test.dart" as sort_A01_t02;
import "sort_A01_t03.test.dart" as sort_A01_t03;
import "sort_A01_t04.test.dart" as sort_A01_t04;
import "sort_A01_t05.test.dart" as sort_A01_t05;
import "sort_A01_t06.test.dart" as sort_A01_t06;

test(List create([int length])) {
  sort_A01_t04.test(create);  
  sort_A01_t05.test(create);  
  sort_A01_t06.test(create);
}
