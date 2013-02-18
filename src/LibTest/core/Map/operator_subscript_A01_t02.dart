/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the value for the given [key] or null if [key] is not in the map.
 * @description Checks that null key is allowed
 * @author msyabro
 * @reviewer varlax
 */


main() {
  Map<int, Object> map = new Map<int, Object>();
  map[null];
}
