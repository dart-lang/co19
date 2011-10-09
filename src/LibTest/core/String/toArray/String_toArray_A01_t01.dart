/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns an array of the code points of this string.
 * @description Check returned array
 * @author msyabro
 */


main() {
  Array array = [97, 98, 99, 100];
  Array stringArray = "abcd".charCodes();
  for(int i = 0; i < stringArray.length; i++) {
    Expect.isTrue(stringArray[i] == array[i]);
  }
  
  stringArray = "".charCodes();
  Expect.isTrue(stringArray.isEmpty());
}
