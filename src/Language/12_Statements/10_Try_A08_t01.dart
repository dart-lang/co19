/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of an on-catch clause on T catch (p1, p2) s of a try statement
 * t proceeds as follows: The statement s is executed in the dynamic scope of the
 * exception handler deﬁned by the ﬁnally clause of t. Then, the current exception
 * and active stack trace both become undeﬁned.
 * @description Checks that the statement s is executed in the dynamic scope of the
 * exception handler deﬁned by the ﬁnally clause.
 * @author kaigorodov
 * @note the assertion is obscure, needs clarification
 */

void main() {
  int executed=0;
  var ex = new Exception("fail");
  try {
    throw ex;
  } on Exception catch(e, st) {
    executed+=1;
  } finally {
    executed+=2;
  }
  Expect.equals(3, executed);
}
