/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether this map contains the given [key].
 * @description Tries to pass null as [key] and checks that NPE is thrown.
 * @author msyabro
 * @reviewer varlax
 */


main() {
  Map<String, Object> map = new Map<String, Object>();
  try {
    map.containsKey(null);
    Expect.fail("NullPointerException is expected");
  } catch(NullPointerException e) {}
}
