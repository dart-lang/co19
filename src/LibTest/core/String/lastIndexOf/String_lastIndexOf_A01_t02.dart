/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the last location of [other] in this string, searching
 * backward starting at [fromIndex] (inclusive).
 * @description Try to pass out of range index
 * @author msyabro
 */


main() {
  Expect.isTrue("a".lastIndexOf("a", -1) == -1);    
  String str = "string";
  Expect.isTrue(str.lastIndexOf("s", str.length) == 0); 
}
