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
  LinkedHashSet<int> test() => <int>{};             //# 01: compile-time error
  LinkedHashSet<int> test() => const <int>{};       //# 02: compile-time error
  LinkedHashSet<int> test() => <int>{1, 2};         //# 03: compile-time error
  LinkedHashSet<int> test() => {1, 2};              //# 04: compile-time error
  LinkedHashSet<int> test() => const <int>{1, 2};   //# 05: compile-time error

  LinkedHashSet test() => <int>{};                  //# 06: compile-time error
  LinkedHashSet test() => const <int>{};            //# 07: compile-time error
  LinkedHashSet test() => <int>{1, 2};              //# 08: compile-time error
  LinkedHashSet test() => {1, 2};                   //# 09: compile-time error
  LinkedHashSet test() => const <int>{1, 2};        //# 10: compile-time error

  LinkedHashSet<C> test() => <C>{};                 //# 11: compile-time error
  LinkedHashSet<C> test() => const <C>{};           //# 12: compile-time error
  LinkedHashSet<C> test() => <C>{new C()};          //# 13: compile-time error
  LinkedHashSet<int> test() => {new C()};           //# 14: compile-time error

  LinkedHashSet test() => <C>{};                    //# 15: compile-time error
  LinkedHashSet test() => const <C>{};              //# 16: compile-time error
  LinkedHashSet test() => <C>{new C()};             //# 17: compile-time error
  LinkedHashSet test() => {new C()};                //# 18: compile-time error
}
