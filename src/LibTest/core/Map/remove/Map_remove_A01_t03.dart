/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Removes the association for the given [key]. Returns null if
 * [key] is not in the map.
 * @description Try to remove key of type that does not have hashCode()
 * @dynamic-type-error
 * @author msyabro
 * @reviewer varlax
 */
 

main() {
  Map<Object, Object> map = new Map<Object, Object>();
  
  map.remove(new Object());
}
