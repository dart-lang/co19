/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Type dynamic has methods for every possible identifier and arity,
 * with every possible combination of named parameters. These methods all have
 * dynamic as their return type, and their formal parameters all have type
 * dynamic.
 * @description Checks that invoking all sorts of methods on a dynamic variable
 * with all sorts of arguments and assigning the results to local variables of
 * various types does not produce any static type warnings.
 * @static-clean
 * @issue #27495
 * @author iefremov
 */
import "../../../Utils/expect.dart";

typedef func();
typedef int func2(int x);

main() {
  dynamic x = null;
  try {
    String y = x.wakeUp(new DateTime(1, 1, 1, 1, 1, 1, 1));
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError {}

  try {
    int i = x.writeConformanceTest(13.6, "Type_Dynamic_A03_t01");
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError {}

  try {
    func f = x.eatPatty();
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError {}

  try {
    func2 f2 = x.goSleep(new Duration(), true, secretFlag: true);
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError {}
}
