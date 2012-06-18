/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Applies the function [f] for each element of the list.
 * @description Checks that the function [f] is called for each element of the list.
 * @author vasya
 * @reviewer iefremov
 */

class A {
  A(bool checked) { this.checked = checked; }
  bool checked;
}

main() {
  List<A> a = new List(100);
  for (int i = 0; i < a.length; i++) {
    a[i] = new A(false);
  }

  void f(A e) { e.checked = true;} 
  a.forEach(f);

  for (int i = 0; i < a.length; i++) {
    Expect.isTrue(a[i].checked);
  }
}
