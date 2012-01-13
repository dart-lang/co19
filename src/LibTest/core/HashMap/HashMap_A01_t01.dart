/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a map with the default implementation.
 * @description Checks that an empty hash map is created
 * @author msyabro
 * @reviewer pagolubev
 */

main() {
  HashMap map = new HashMap();
  Expect.isTrue(map is HashMap);
  Expect.isTrue(map.isEmpty());
}
