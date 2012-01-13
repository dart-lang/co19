/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If [start] is not specified, searches the entire list.
 * @description Checks searching w/o start.
 * @author varlax
 */

checkList(List list, var elem, int expected) {
  Expect.equals(expected, list.indexOf(elem));
}

check(List ls) {
  checkList(ls, 42, 0);
  checkList(ls, 777, -1);
  checkList(ls, null, -1);
  checkList(ls, 0, 1);
  checkList(ls, 6031769, 5);
}

main() {
  var a = [42, 0, -1, 42, -1, 6031769, 0];
  check(a);

  check(new List.from(a));

  check(const<int>[42, 0, -1, 42, -1, 6031769, 0]);

  List<int> b = new List<int>(a.length);
  for(var i = 0; i<a.length; i++) {
    b[i] = a[i];
  }
  check(b);
}

