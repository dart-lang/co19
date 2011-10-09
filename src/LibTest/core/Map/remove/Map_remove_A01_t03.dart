/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Removes the association for the given [key]. Returns null if
 * [key] is not in the map.
 * @description Try to remove key of different type
 * @static-type-error
 * @author msyabro
 * @reviewer varlax
 * @needsreview: this is rather compiler check 
*/
 

main() {
  Map<String, Object> map = new Map<String, Object>();
  
  map["1"] = "1";
  Expect.isTrue(map.remove(1) == null);
}
