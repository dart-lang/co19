/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An on-catch clause of the form catch (p) s is equivalent to an
 * on-catch clause on dynamic catch (p) s. An on-catch clause of the form
 * catch (p1, p2) s is equivalent to an on-catch clause
 * on dynamic catch (p1, p2) s.
 * @description Checks that a catch clause with no particular type specified for
 * the first exception parameter matches any object.
 * @author rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

class T1 {}
class T2 extends T1 {}

main() {
  bool success = false;
  try {
    throw new T2();
  } catch (p1) {
    success = true;
  }
  Expect.isTrue(success);

  success = false;
  try {
    throw new T1();
  } catch (p1) {
    success = true;
  }
  Expect.isTrue(success);

  success = false;
  try {
    throw "foo";
  } catch (p1, st) {
    success = true;
  }
  Expect.isTrue(success);
}
