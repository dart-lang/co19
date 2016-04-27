/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function body of the form => e is equivalent to a body of
 * the form {return e;} or the form async => e which is equivalent to a body
 * of the form async {return e;}.
 *
 * @description Checks that the function body of the form => e is equivalent
 * to a body of the form {return e;}.
 *
 * @author msyabro
 * @reviewer kaigorodov
 */
import "../../Utils/expect.dart";

main() {
  int x = 2;

  foo1() => 1;
  foo2() {return 1;}
  bar1(int val) => val * 2;
  bar2(int val) {return val * 2;}

  Expect.equals(foo1(), foo2());
  Expect.equals(bar1(5), bar2(5));
}
