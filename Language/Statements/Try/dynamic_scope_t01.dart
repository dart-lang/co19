/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of an on-catch clause on T catch (p1, p2) s of a try
 * statement t proceeds as follows: The statement s is executed in the dynamic
 * scope of the exception handler defined by the finally clause of t. Then, the
 * current exception and active stack trace both become undefined.
 * @description Checks that the statement s is executed in the dynamic scope of
 * the exception handler defined by the finally clause by checking that the two
 * arguments of a catch clause are indeed available within it along with all
 * those declared in the enclosing scopes.
 * @author kaigorodov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

void main() {
  int executed = 0;
  var ex = new Exception("fail");
  try {
    throw ex;
  } on Exception catch (e, st) {
    executed += 1;
    Expect.identical(ex, e);
    Expect.isTrue(st != null);
  } finally {
    executed += 2;
  }
  Expect.equals(3, executed);
}
