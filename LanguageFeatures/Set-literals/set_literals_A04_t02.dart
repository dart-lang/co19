/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of s is Set<T>.
 *
 * @description Checks that the static type of s is Set<T>.
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";

class C {}

main() {
  LinkedHashSet<int> test1() => <int>{};             //# 01: compile-time error
  LinkedHashSet<int> test2() => const <int>{};       //# 02: compile-time error
  LinkedHashSet<int> test3() => <int>{1, 2};         //# 03: compile-time error
  LinkedHashSet<int> test4() => {1, 2};              //# 04: compile-time error
  LinkedHashSet<int> test5() => const <int>{1, 2};   //# 05: compile-time error

  LinkedHashSet test6()  => <int>{};                 //# 06: compile-time error
  LinkedHashSet test7()  => const <int>{};           //# 07: compile-time error
  LinkedHashSet test8()  => <int>{1, 2};             //# 08: compile-time error
  LinkedHashSet test9()  => {1, 2};                  //# 09: compile-time error
  LinkedHashSet test10() => const <int>{1, 2};       //# 10: compile-time error

  LinkedHashSet<C> test11() => <C>{};                //# 11: compile-time error
  LinkedHashSet<C> test12() => const <C>{};          //# 12: compile-time error
  LinkedHashSet<C> test13() => <C>{new C()}          //# 13: compile-time error
  LinkedHashSet<int> test14() => {new C()};          //# 14: compile-time error

  LinkedHashSet test15() => <C>{};                   //# 15: compile-time error
  LinkedHashSet test16() => const <C>{};             //# 16: compile-time error
  LinkedHashSet test17() => <C>{new C()};            //# 17: compile-time error
  LinkedHashSet test18() => {new C()};               //# 18: compile-time error
}
