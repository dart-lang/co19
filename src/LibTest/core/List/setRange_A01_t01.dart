/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Copies [length] elements of the [from] array, starting
 * from [startFrom], into [:this:], starting at [start].
 * The length of this array does not change, previous entries 
 * in the range are replaced by the new contents.
 * @description Checks trivial copying: 0 and 1 elements.
 * @author iefremov
 * @reviewer msyabro
 * @reviewer varlax
 */

class A{A(){}}


main() {
  var a = new A();
  List dst = new List(1);
  List src = new List(1);
  src[0] = a;
  dst.setRange(0, 1,src, 0);
  Expect.isTrue(dst[0] == a);
  Expect.identical(dst[0], a);
  Expect.isTrue(dst.length == 1);

  //zero case
  dst = new List(0);
  src = new List(0);
  dst.setRange(0, 0, src);
  Expect.isTrue(dst.length == 0);
}
