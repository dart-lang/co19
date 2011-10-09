/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether this map contains the given [key].
 * @description Try to pass [key] of different type
 * @static-type-error
 * @author msyabro
 * @reviewer varlax
 * @needsreview: this is rather compiler check 
 */
 
class A {
  A() {}
  int hashCode() {
    return 1;
  }
}


main() {
  Map<String, Object> map = new Map<String, Object>();
  map.containsKey(new A());
}
