/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An on-catch clause of the form on T catch (p1, p2) s introduces
 * a new scope CS in which final local variables specified by p1 and p2 are
 * defined. The statement s is enclosed within CS. The static type of p1 is T
 * and the static type of p2 is StackTrace.
 * @description Checks that on-catch clause introduces a new scope in which
 * final local variables p1 and p2 are defined, and block s is enclosed within
 * this scope.
 * @author ngl@unipro.ru
 */
import '../../../Utils/expect.dart';

String p1 = "abc";
StackTrace p2 = null;
String p1_1 = "abc";
StackTrace p2_1 = null;

main() {
  Expect.equals(p1, p1_1);
  Expect.equals(p2, p2_1);
  try {
    throw "foo";
  } on String catch (p1, p2) {
    p1_1 = p1;
    p2_1 = p2;
  }
  Expect.notEquals(p1, p1_1);
  Expect.notEquals(p2, p2_1);
}
