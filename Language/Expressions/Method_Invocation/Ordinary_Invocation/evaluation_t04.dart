/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an ordinary method invocation i of the form
 * o.m(a1 , . . . , an , xn+1 : an+1 , . . . , xn+k : an+k)
 * proceeds as follows:
 * First, the expression o is evaluated to a value vo. Next, the argument list
 * (a1 , . . . , an , xn+1 : an+1 , . . . , xn+k : an+k) is evaluated
 * yielding actual argument objects o1 , . . . , on+k . Let f be the result of
 * looking up method m in vo with respect to the current library L.
 * Let p1 . . . ph be the required parameters of f, let p1 . . . pm be the
 * positional parameters of f and let ph+1 , . . . , ph+l be the named
 * parameters declared by f.
 * If n < h, or n > m, the method lookup has failed. Furthermore, each
 * xi , n + 1 <= i <= n + k, must have a corresponding named parameter in the
 * set {ph+1 , . . . , ph+l} or the method lookup also fails. Otherwise
 * method lookup has succeeded.
 * If the method lookup succeeded, the body of f is executed with respect to
 * the bindings that resulted from the evaluation of the argument list, and
 * with this bound to vo. The value of i is the value returned after f is
 * executed.
 * @description Checks that the method lookup fails if a form o.m() has a
 * parameters mismatch listed above with the vo class's instance method.
 * @static-warning
 * @author ilya
 */
import '../../../../Utils/expect.dart';

class C {
  positional(x, y, [u, v]) {}
  named(x, y, {foo, bar}) {}
}

main()  {
  var c = new C();

  Expect.throws(() => c.positional(1));             // too few required
  Expect.throws(() => c.positional(1, 2, 3, 4, 5)); // too much positional
  Expect.throws(() => c.named(1));                  // too few required
  Expect.throws(() => c.named(1, 2, 3));            // too much positional
  Expect.throws(() => c.named(1, 2, foo:0, a:1));   // unknown parameter name
}
