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
 * @description Checks that all needed elements are copied.
 * @author iefremov
 * @reviewer msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

check(dst) {
  List src = [dst, null];
  src[1] = src;

  dst.setRange(0, 2, src);
  Expect.listEquals([dst, src, null, null, null], dst);

  dst.setRange(4, 1, src);
  Expect.listEquals([dst, src, null, null, dst], dst);

  dst.setRange(2, 2, src);
  Expect.listEquals([dst, src, dst, src, dst], dst);
}

main() {
  check(new List(5));

  var a = [];
  a.length = 5;
  check(a);

  a = new List();
  a.length = 5;
  check(a);

  a = new List.from([]);
  a.length = 5;
  check(a);
}
