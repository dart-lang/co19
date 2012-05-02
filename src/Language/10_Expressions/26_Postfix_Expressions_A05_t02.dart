/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A postfix expression of the form e1 [e2 ]++, is equivalent to
 * (a, i){var r = a[i]; a[i] = r + 1; return r}(e1 , e2 ).
 * @description Checks that a postfix expression of the form e1 [e2 ]++, is equivalent to
 * (a, i){var r = a[i]; a[i] = r + 1; return r}(e1 , e2 ) in implementation
 * (basically, that postfix ++ works via operator+ in the described manner).
 * @author rodionov
 */

bool plusInvoked = false;

class A {
  final String value;
  
  A(this.value);
  
  operator +(var other) {
    plusInvoked = true;
    return new A("${value}${other}");
  }
}

main() {
  List e1 = [new A("foo")];
  Expect.isFalse(plusInvoked);

  Expect.equals("foo", (e1[0]++).value);
  Expect.isTrue(plusInvoked);
  Expect.equals("foo1", e1[0].value);
}
