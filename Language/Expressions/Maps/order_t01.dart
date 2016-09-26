/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A map literal is ordered: iterating over the keys and/or values
 * of the maps always happens in the order the keys appeared in the source
 * code.
 * @description Checks that a map literal is ordered.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

var orderKeys;
var orderValues;

func(var k, var v) {
  orderKeys = '$orderKeys$k';
  orderValues = '$orderValues$v';
}

main() {
  //runtime map
  orderKeys = "";
  orderValues = "";
  var m = {"1": 1, "2": 2, "3": 3, "4": 4};
  m.forEach(func);
  Expect.equals("1234", orderKeys);
  Expect.equals("1234", orderValues);

  //repeating keys
  orderKeys = "";
  orderValues = "";
  m = {"5": 5, "2": 2, "3": 3, "4": 4};
  m.forEach(func);
  Expect.equals("5234", orderKeys);
  Expect.equals("5234", orderValues);

  //constant map
  orderKeys = "";
  orderValues = "";
  m = const {"1": 1, "2": 2, "3": 3, "4": 4, "5": 5};
  m.forEach(func);
  Expect.equals("12345", orderKeys);
  Expect.equals("12345", orderValues);
}
