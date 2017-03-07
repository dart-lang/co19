/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion class Object
 * @description Aggregates tests for Object methods: hashCode, operator ==
 * and noSuchMethod
 * @author a.semenov@unipro.ru
 */
library allTests_A01_t01;

import "hashCode_A01_t01.test.dart" as hashCode_A01_t01;
import "hashCode_A01_t02.test.dart" as hashCode_A01_t02;
import "hashCode_A01_t03.test.dart" as hashCode_A01_t03;
import "noSuchMethod_A01_t01.test.dart" as noSuchMethod_A01_t01;
import "operator_equality_A02_t02.test.dart" as operator_equality_A02_t02;
import "operator_equality_A03_t02.test.dart" as operator_equality_A03_t02;
import "operator_equality_A03_t03.test.dart" as operator_equality_A03_t03;
import "operator_equality_A04_t01.test.dart" as operator_equality_A04_t01;
import "operator_equality_A05_t01.test.dart" as operator_equality_A05_t01;
import "operator_equality_A05_t02.test.dart" as operator_equality_A05_t02;
import "toString_A02_t01.test.dart" as toString_A02_t01;
import "runtimeType_A02_t01.test.dart" as runtimeType_A02_t01;

test(Object create(),
     List<Object> createEqual(int number),
     List<Object> createNotEqual(int number)) {
  // hashCode
  hashCode_A01_t01.test(create);
  hashCode_A01_t02.test(create);
  hashCode_A01_t03.test(createEqual);
  // noSuchMethod
  noSuchMethod_A01_t01.test(create);
  // operator ==
  operator_equality_A02_t02.test(create);
  operator_equality_A03_t02.test(createEqual);
  operator_equality_A03_t03.test(createNotEqual);
  operator_equality_A04_t01.test(createEqual);
  operator_equality_A05_t01.test(createEqual);
  operator_equality_A05_t02.test(createNotEqual);
  // toString()
  toString_A02_t01.test(create);
  // runtimeType
  runtimeType_A02_t01.test(create);
}
