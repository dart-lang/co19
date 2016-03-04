/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A try statement of the form try s1 on−catch1 ... on−catchn; is
 * equivalent to the statement try s1 on−catch1 ... on−catchn finally {};
 * @description checks that both forms are equivalent as far as execution of
 * the on-catch clauses is concerned.
 * @author kaigorodov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

class E0 implements Exception {}
class E1 implements Exception {}
class E2 extends E1 {}
class E3 extends E1 {}

int test1(void f()) {
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
  }

  return log;
}

int test2(void f()) {
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
  }
  finally {}

  return log;
}

void test(void f()) {
  Expect.equals(test1(f), test2(f));
}

void main() {
  test(() {});
  test(() {throw new E0();});
  test(() {throw new E1();});
  test(() {throw new E2();});
  test(() {throw new E3();});
  test(() {throw 1;});
}
