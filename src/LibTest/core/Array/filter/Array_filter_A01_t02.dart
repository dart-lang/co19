/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a new array with the elements of this array that satisfy the predicate [f]. 
 * @description Checks that method is called for all elements of the array.
 * @author vasya
 * @reviewer iefremov
 */

class A {
  A(bool checked) { this.checked = checked;  }
  bool checked;
}


main() {
  Array<A> a = new Array[100];
  for(var i = 0; i < a.length; i++) {
    a[i] = new A(false);
  }

  bool f(A e) { 
    e.checked = true; 
    return false; 
  }

  a.filter(f);
  for(var i = 0; i < a.length; i++) {
    Expect.isTrue(a[i].checked);
  }

  a = [new A(false)];
  a.filter(f);
  Expect.isTrue(a[0].checked);
}
