/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Removes the association for the given [key]. Returns null if
 * [key] is not in the map.
 * @description Checks that null key can be removed without error.
 * @author msyabro
 * @reviewer varlax
 */
 

main() {
  Map<String, Object> map = new Map<String, Object>();
  
  map[null] = 1;
  Expect.isTrue(map.containsKey(null));
  map.remove(null);
  Expect.isFalse(map.containsKey(null));
}
