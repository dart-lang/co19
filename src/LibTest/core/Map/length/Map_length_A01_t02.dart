/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The number of {key, value} pairs in the map.
 * @description Checks that the size of map can be more than MAX_INT.
 * @author msyabro
 * @reviewer varlax
 */
 

main() {
  Map<int, Object> map = new Map<int, Object>();
  
  for(int i = 0; i < 2147483648; i++) { //MAX_VALUE + 1 for Integer in Java
    map[i] = i;
  }
  
  Expect.isTrue(map.length == 2147483648);
}
