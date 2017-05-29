/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
 
library toInt8;
//import "../../../Utils/expect.dart";

int toInt16(x) {
  x =x & 0xFFFF;
  if (x & 0x8000 == 0) {
    return x;
  } else {
    return -((~(x & 0x7FFF) & 0x7FFF) + 1);
    /*
    var m=x & 0x7FFF;
    print ("m=$m");
    m=~m;
    print ("~m=$m");
    m=m & 0x7FFF;
    print ("m31=$m");
    m=m+1;
    print ("m+1=$m");
    m=-m;
    print ("m=$m");
    return m;
    */
  }
}
/*
check(x, y) {
  Expect.equals(x, toInt32(y));
}

main() {
  check(0,0);
  check(0, 0x800);
  check(-1, 0xffffffff);
}
*/