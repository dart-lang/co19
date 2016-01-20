/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of i proceeds as follows:
 * First, the argument list (a1, ..., an, xn+1 : an+1, ..., xn+k : an+k) is
 * evaluated yielding actual argument objects o1, ..., on+k. Let g be the
 * method currently executing, and let C be the class in which g was looked
 * up. Let Sdynamic be the superclass of C, and let f be the result of
 * looking up method m in Sdynamic with respect to the current library L.Let
 * p1 ... ph be the required parameters of f, let p1 ... pm be the positional
 * parameters of f and let ph+1, ..., ph+l be the optional parameters
 * declared by f.
 * If n < h, or n > m, the method lookup has failed. Furthermore, each
 * xi, n+1 ≤ i ≤ n+k, must have a corresponding named parameter in the set
 * {pm+1, ..., ph+l} or the method lookup also fails. Otherwise method lookup
 * has succeeded.
 * If the method lookup succeeded, the body of f is executed with respect to
 * the bindings that resulted from the evaluation of the argument list, and
 * with this bound to the current value of this. The value of i is the value
 * returned after f is executed.
 * @description Checks that the argument list is evaluated before the method
 * lookup.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../../Utils/expect.dart';

StringBuffer buffer;

class S {
  var f;
}

class A extends S {
  operator +(otherOperand) {
    buffer.write(1);
  }
  operator -(otherOperand) {
    buffer.write(2);
  }
  test() {
    buffer = new StringBuffer();
    try {
      super.f(new A() + 1, new A() - 1);
      Expect.fail("NoSuchMethodError expected.");
    } on NoSuchMethodError catch (e) {
      Expect.equals("12", buffer.toString());
    }
  }
}


main()  {
  new A().test();
}
