/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Applies the function [f] for each element of the array.
 * @description Checks that function is called for each element of the array.
 * @author vasya
 * @reviewer iefremov
 */

class A {
  A(bool checked) { this.checked = checked; }
  bool checked;
}


main() {
  Array<A> a = new Array(100);
  for (int i = 0; i < a.length; i++) {
    a[i] = new A(false);
  }

  void f(A e) { e.checked = true;} 
  a.forEach(f);

  for (int i = 0; i < a.length; i++) {
    Expect.isTrue(a[i].checked == true);
  }
}
