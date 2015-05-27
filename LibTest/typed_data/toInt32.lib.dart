/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
 
library toInt32;
//import "../../../Utils/expect.dart";

int toInt32(x) {
  x =x & 0xFFFFFFFF;
  if (x & 0x80000000 == 0) {
    return x;
  } else {
    return -((~(x & 0x7FFFFFFF) & 0x7FFFFFFF)+1);
    /*
    var m=x & 0x7FFFFFFF;
    print ("m=$m");
    m=~m;
    print ("~m=$m");
    m=m & 0x7FFFFFFF;
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
  check(0, 0x800000000);
  check( 0x00ffffff, 0x00ffffff);
  check( 0x7fffffff, 0x7fffffff);
  check(-1, 0xffffffff);
  check(-2147483648, 0x80000000);
}
*/