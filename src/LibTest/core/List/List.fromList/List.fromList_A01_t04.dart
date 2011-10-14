/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a list which is a subcopy of [other], starting at
 * [startIndex] (inclusive) and ending at [endIndex] (exclusive).
 * If [startIndex] is negative, it has the same effect as if it were
 * zero. If [endIndex] is greather than the length, it has the same
 * effect as if it were [other.length]. If [startIndex > endIndex],
 * the created list is of [length] 0.
 * @description Checks that if [startIndex > endIndex], the created list is of [length] 0.
 * @author vasya
 * @reviewer msyabro
 */

main() {
  List a = [null];
  List b = new List.fromList(a,0,-1);
  Expect.isTrue(b.length == 0);
  
  b = new List.fromList(a,1,0);
  Expect.isTrue(b.length == 0);

  a = [[]];
  b = new List.fromList(a,100,99);
  Expect.isTrue(b.length == 0);

  a = new List(32157);
  b = new List.fromList(a,32158,32157);
  Expect.isTrue(b.length == 0);

  b = new List.fromList(a,-100,-1);
  Expect.isTrue(b.length == 0);

  b = new List.fromList(a,-32159,-1);
  Expect.isTrue(b.length == 0);
}
