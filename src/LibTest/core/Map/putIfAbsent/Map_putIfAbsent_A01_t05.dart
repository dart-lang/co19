/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If [key] is not associated to a value, calls [ifAbsent] and
 * updates the map by mapping [key] the value returned by
 * [ifAbsent]. Returns the value in the map.
 * @description Try to pass object without hashCode() as a [key]
 * @dynamic-type-error
 * @author msyabro
 * @reviewer varlax
 */


main() {
  bool  putIfAbsent() { return true;}
  Map<Object, bool> map = new Map<Object, bool>();
  
  map.putIfAbsent(new Object(), putIfAbsent);
}
