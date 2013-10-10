/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Iterable.generate(int count, E generator(int index))
 * Creates an Iterable that generates its elements dynamically.
 * The Iterators created by the Iterable count from zero to count-1 while iterating,
 * and call generator with that index to create the next value.
 * @description Checks that Iterators created by the Iterable count from zero to [count]-1
 * while iterating, and call [generator] with that index to create the next value.
 * Checks that Iterators created by the Iterable contain
 * results of invocations to [generator].
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

void check(int count) {
 int expected=0; 
 int generator(int index) {
   Expect.equals(expected, index);
   expected++;
   return index*3;
 }
 Iterator it=new Iterable.generate(count, generator);
 int index=0;
 for (var v in it) {
   Expect.equals(index*3, v);
   index++;
 }
 Expect.equals(expected, count);
}

main() {
  check(0);
  check(1);
  check(10);
  check(1000);
}
