/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a new list with the elements of this list that satisfy the predicate [f].
 * @description Checks that the predicate method is called for all elements of the list.
 * @author vasya
 * @reviewer iefremov
 */

class A {
  A(bool checked) { this.checked = checked;  }
  bool checked;
}


main() {
  List<A> a = new List(100);
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
