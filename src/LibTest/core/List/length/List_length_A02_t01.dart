/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Changes the length of the list. If [newLength] is greater than
 * the current [length], entries are initialized to [null].
 * @description Checks that the length can be changed if list is growable.
 * @author vasya
 * @reviewer msyabro
 */

main() {
  List a = new List();
  Expect.isTrue(a.length == 0);

  a.length = 100;
  a[99] = 1;
  Expect.isTrue(a.length == 100 && a[99] == 1);

  a.length = 0;
  Expect.isTrue(a.length == 0);

  a.length = 1000001;
  a[1000000] = 1;
  Expect.isTrue(a.length == 1000001 && a[1000000] == 1);

  a.length = 1;
  a[0] = 1;
  Expect.isTrue(a.length == 1 && a[0] == 1);
}
