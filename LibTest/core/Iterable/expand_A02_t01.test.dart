/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Iterable expand(Iterable f(E element))
 * The returned Iterable is lazy, and will call f for each element of this every
 * time it's iterated.
 * @description Checks that the returned Iterable is lazy.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

void check(List a) {
  a.expand((var element) {
    throw new Exception("should not be called");
  });
}

main() {
  List a=new List();
  check(a);
  a.add(2);
  check(a);
  a.add(1);
  check(a);
  a.add(1);
  check(a);
}
