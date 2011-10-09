/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if some elements of the array satisfy the predicate [f]. 
 * @description Checks that method is called for all elements of the array.
 * @author vasya
 * @reviewer iefremov
 */

class A {
  A(bool checked) { this.checked = checked;  }
  bool checked;
}


main() {
  Array<A> a = new Array(300);
  for(var i = 0; i < a.length; i++) {
    a[i] = new A(false);
  }
  
  bool f(A e) { e.checked = true; return false; }
  a.some(f);
  for(var i = 0; i < a.length; i++) {
    Expect.isTrue(a[i].checked);
  }
  
  a[299].checked = false;
  Expect.isTrue(a.some( bool f(A e) { return (e.checked == false); } ));
}
