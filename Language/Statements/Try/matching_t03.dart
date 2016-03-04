/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An on-catch clause of the form on T catch (p1 , p2 ) s matches an
 * object o if the type of o is a subtype of T.
 * @description Checks that a catch clause matches an object o if the type of o
 * is a subtype of T1.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

import 'try_lib.dart';

class T1 {
  T1() {}
}
class T2 extends T1 {
  T2() {}
}

main() {
  bool success = false;
  try {
    throw new T2();
  } on T1 catch (p1, st) {
    success = true;
  }
  Expect.isTrue(success);

  // imported type
  success = false;
  try {
    throw new Foo();
  } on Foo catch (p1, st) {
    success = true;
  }
  Expect.isTrue(success);
}
