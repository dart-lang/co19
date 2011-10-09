/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether this map contains the given [key].
 * @description Try to use [key] type without hashCode
 * @dynamic-type-error
 * @author msyabro
 * @reviewer varlax
 */
 
class A {
  A() {}
}


main() {
  Map<A, Object> map = new Map<A, Object>();
  map.containsKey(new A());
}
