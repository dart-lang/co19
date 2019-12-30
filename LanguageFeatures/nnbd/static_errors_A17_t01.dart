/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error for a variable to be declared as late in any of the
 * following positions: in a formal parameter list of any kind; in a catch
 * clause; in the variable binding section of a c-style for loop, a for in loop,
 * an await for loop, or a for element in a collection literal.
 *
 * @description Check that it is an error for a formal parameter to be declared
 * late.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
class C {
  C(late int x) {}                                //# 01: compile-time error
  C(int x, [late String y]) {}                    //# 02: compile-time error
  C(int x, {late String y}) {}                    //# 03: compile-time error

  static void s1(late int x) {}                   //# 04: compile-time error
  static void s2(int x, [late String y]) {}       //# 05: compile-time error
  static void s3(int x, {late String y}) {}       //# 06: compile-time error

  void m1(late int x) {}                          //# 07: compile-time error
  void m2(int x, [late String y]) {}              //# 08: compile-time error
  void m3(int x, {late String y}) {}              //# 09: compile-time error

  void set(late int x) {}                         //# 10: compile-time error
  C operator +(late C other) => other;            //# 11: compile-time error
}

void f1(late int x) {}                            //# 12: compile-time error
void f2(int x, [late String y]) {}                //# 13: compile-time error
void f3(int x, {late String y}) {}                //# 14: compile-time error

main() {
}
