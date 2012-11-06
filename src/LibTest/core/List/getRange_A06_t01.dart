/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Method fails gracefully if supplied with argument of invalid type.
 * @description Throws [ArgumentError] if [start] or [length] is not an int.
 * @author varlax
 * @reviewer iefremov
 */

import "../../../Utils/dynamic_check.dart";

void check(List l, start, length) {
  if(!isCheckedMode()) {
    Expect.throws(
    () {
        l.getRange(start, length);
    });
  }
}

main() {
  check(new List(10),"0",1);
  check(new List(1),0,1.1);
  check(new List(1),0,check);
  check(new List(1),true,false);

  check(new List.from([10]),"0",1);
  check(new List.from([11]),0,1.1);
  check(new List.from([11]),0,check);
  check(new List.from([11]),true,false);

  check([10],"0",1);
  check([11],0,1.1);
  check([11],0,check);
  check([11],true,false);
}
