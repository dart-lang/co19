/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Copies into this list the elements from [src] in the given range.
 * @description Checks trivial case.
 * @author iefremov
 * @reviewer msyabro
 */

class A{A(){}}


main() {
  var a = new A();
  List dst = new List(1);
  List src = new List(1);
  src[0] = a;
  dst.copyFrom(src, 0, 0, 1);
  Expect.isTrue(dst[0] == a);
  Expect.isTrue(dst[0] === a);
  Expect.isTrue(dst.length == 1);

  //zero case
  dst = new List(0);
  src = new List(0);
  dst.copyFrom(src, 0, 0, 0);
  Expect.isTrue(dst.length == 0);
}
