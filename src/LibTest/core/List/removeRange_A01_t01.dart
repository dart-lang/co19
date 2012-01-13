/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Removes the range in the list starting from [start] to
 * [:start + length:].
 * @description Checks valid removals.
 * @author vasya
 * @reviewer varlax
 */

main() {
  var a = new List();
  var b = [0,1,2,3,4,5,6,7,8,9];
  a.addAll(b);
  Expect.equals(b.length, a.length);
  a.removeRange(5, 5);
  Expect.equals(5, a.length);
  for (var i = 0; i < a.length; i++){
    Expect.equals(i, a[i]);
  }

  a.removeRange(0, 5);
  Expect.equals(0, a.length);

  a.length = 100;
  a[99] = -1;
  a.removeRange(0, 99);
  Expect.equals(1, a.length);
  Expect.equals(-1, a[0]);
}
