/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Associates the [key] with the given [value].
 * @description Checks that null key is allowed.
 * @author msyabro
 * @reviewer varlax
 */


main() {
  Map<String, Object> map = new Map<String, Object>();
  map[null] = 1;
}
