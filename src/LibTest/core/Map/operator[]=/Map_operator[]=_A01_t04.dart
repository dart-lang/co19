/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Associates the [key] with the given [value].
 * @description Tries to pass [key] without hashCode().
 * @dynamic-type-error
 * @author msyabro
 * @reviewer varlax
 */

class A {
  A() {}
}


main() {
  Map<A, Object> map = new Map<A, Object>();
  map[new A()] = 1;
}
