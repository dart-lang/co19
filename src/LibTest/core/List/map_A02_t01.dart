/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Iterable map(f(E element))
 * As long as the returned Iterable is not iterated over, the supplied function f will not
 * be invoked.
 * @description Checks that the supplied function f will not be invoked if the returned
 * Iterable is not iterated over.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

boolean invoked=false;

f(var element) {
  invoked=true;
  return element;
}
  
main() {
  List a=new List();
  a.map(f);
  a.add(22);
  a.map(f);
  a.add(11);
  a.map(f);
  a.add(11);
  a.map(f);
  for (int k=-100; k<200; k++) {
    a.add(k);
  }
  a.map(f);
  Expect.isFalse(invoked);
}
