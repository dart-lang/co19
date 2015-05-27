/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void removeWhere(bool test(E element))
 * Remove all elements matched by test.
 * @description Checks that all elements that satisfy test are removed, and
 * elements that does not are left.
 * @author kaigorodov
 */
library removeWhere_A01_t01;
 
import "../../../Utils/expect.dart";
import "dart:collection";

test(ListQueue create([Iterable content])) {
  List a0=[1,3,3,4,5,6];

  void check(bool test(var element)) {
    ListQueue a=create(a0);
    a.removeWhere(test);
    int k=0;
    for (int k0=0; k0<a0.length; k0++) {
      if (!test(a0[k0])) {
        Expect.identical(a0[k0], a.elementAt(k), "k0=$k0, k=$k");
        k++;
      }
    }
    Expect.equals(a.length, k, "a.length=${a.length} k=$k");
  }

  check((var element)=>true);
  check((var element)=>false);
  check((var element)=>element>4);
  check((var element)=>element<4);
  check((var element)=>element==4);
}
