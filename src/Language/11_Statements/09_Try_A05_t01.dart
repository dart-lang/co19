/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A try statement try s1 catch1...catchn finally sf defines an exception
 * handler h that executes as follows:
 * The catch clauses are examined in order, starting with catch1, until either
 * a catch clause that matches the current exception (11.14) is found, or the list
 * of catch clauses has been exhausted. If a catch clause catchk is found, then
 * pk1 is bound to the current exception, pk2, if declared, is bound to the current stack trace
 * (11.14), and then catchk is executed. If no catch clause is found, the finally
 * clause is executed. Then, execution resumes at the end of the try statement.
 * A finally clause "finally s" defines an exception handler h that executes by
 * executing the finally clause. Then, execution resumes at the end of the try
 * statement.
 * Execution of a catch clause "catch (p1, p2) s" of a try statement t proceeds as follows: 
 * The statement s is executed in the dynamic scope of the exception
 * handler defined by the finally clause of t. Then, the current exception and
 * current stack trace both become undefined.
 * Execution of a finally clause "finally s" of a try statement proceeds as follows:
 * The statement s is executed. Then, if the current exception is defined,
 * control is transferred to the nearest dynamically enclosing exception handler.
 * Execution of a try statement of the form "try s1 catch1...catchn finally sf;"
 * proceeds as follows:
 * The statement s1 is executed in the dynamic scope of the exception handler
 * defined by the try statement. Then, the finally clause is executed.
 * @description Checks that the catch clauses are examined in order, starting with catch1,
 * until a catch clause that matches the current exception is found.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

class T1 { }
class T2 { }
class T3 { }

main() {
  bool ok = false;
  try {
    throw new T1();
  } catch (T1 p1) {
    ok = true;
  } catch (T2 p2) {
    Expect.fail("This clause shouldn't be executed");
  } catch (T3 p3) {
    Expect.fail("This clause shouldn't be executed");
  }

  Expect.isTrue(ok, "Correct catch clause was not executed!");
  ok = false;

  try {
    throw new T2();
  } catch (T1 p1) {
    Expect.fail("This clause shouldn't be executed");
  } catch (T2 p2) {
    ok = true;
  } catch (T3 p3) {
    Expect.fail("This clause shouldn't be executed");
  }
  Expect.isTrue(ok, "Correct catch clause was not executed!");
  ok = false;

  try {
    throw new T3();
  } catch (T1 p1) {
    Expect.fail("This clause shouldn't be executed");
  } catch (T2 p2) {
    Expect.fail("This clause shouldn't be executed");
  } catch (T3 p3) {
    ok = true;
  }
  Expect.isTrue(ok, "Correct catch clause was not executed!");
  ok = false;

  try {
    throw "";
  } catch (T1 p1) {
    Expect.fail("This clause shouldn't be executed");
  } catch (T2 p2) {
    Expect.fail("This clause shouldn't be executed");
  } catch (T3 p3) {
    Expect.fail("This clause shouldn't be executed");
  } catch (var ex) {
    ok = true;
  }
  Expect.isTrue(ok, "Correct catch clause was not executed!");
  ok = false;
}
