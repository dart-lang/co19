/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If [:startIndex > endIndex:], the created list is of [length] 0.
 * @description Checks that if startIndex > endIndex, the created list has zero length.
 * @author vasya
 * @reviewer msyabro
 * @reviewer varlax
 */

main() {
  List a = [null];
  List b = new List.fromList(a,0,-1);
  Expect.equals(0, b.length);
  
  b = new List.fromList(a,1,0);
  Expect.equals(0, b.length);

  a = [[]];
  b = new List.fromList(a,100,99);
  Expect.equals(0, b.length);

  a = new List(32157);
  b = new List.fromList(a,32158,32157);
  Expect.equals(0, b.length);

  b = new List.fromList(a,-100,-1);
  Expect.equals(0, b.length);

  b = new List.fromList(a,-32159,-1);
  Expect.equals(0, b.length);
}
