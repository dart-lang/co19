/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the value for the given [key] or null if [key] is not in the map.
 * @description Tries to pass null [key] and check that NPE is thrown.
 * @author msyabro
 * @reviewer varlax
 */


main() {
  Map<int, Object> map = new Map<int, Object>();
  
  try {
    map[null];
    Expect.fail("NullPointerException is expected");
  } on NullPointerException catch(e) {}
}
