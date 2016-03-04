/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a try statement of the form try s1 on−catch1 ...
 * on−catchn finally sf; proceeds as follows:
 *   The statement s1 is executed in the dynamic scope of the exception handler
 * defined by the try statement. Then, the finally clause is executed.
 *   Whether any of the on-catch clauses is executed depends on whether a
 * matching exception has been raised by s1 (see the specification of the throw
 * statement).
 *   If s1 has raised an exception, it will transfer control to the try statements
 * handler, which will examine the catch clauses in order for a match as
 * specified above. If no matches are found, the handler will execute the
 * finally clause.
 *   If a matching on-catch was found, it will execute first, and then the
 * finally clause will be executed.
 * @description Checks the execution order of the various parts of a try
 * statement.
 * @author kaigorodov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

class E0 implements Exception {}
class E1 implements Exception {}
class E2 extends E1 {}
class E3 extends E1 {}

void test(void f(), int expected) {
  int log = 0;
  void append(int digit) {log = log * 10 + digit;}

  try {
    append(1);
    f();
    append(2);
  } on E2 catch (e) {
    append(3);
  } on E1 catch (e) {
    append(4);
  } catch (e) {
    append(5);
  } finally {
    append(6);
  }

  Expect.equals(expected, log);
}

void main() {
  test(() {}, 126);
  test(() {throw new E0();}, 156);
  test(() {throw new E1();}, 146);
  test(() {throw new E2();}, 136);
  test(() {throw new E3();}, 146);
  test(() {throw 1;}, 156);
}
