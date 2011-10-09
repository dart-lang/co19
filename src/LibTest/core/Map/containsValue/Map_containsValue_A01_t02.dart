/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether this map contains the given [value].
 * @description Check [value] of different type
 * @static-type-error
 * @author msyabro
 * @reviewer varlax
 * @needsreview: this is rather compiler check 
*/
 

main() {
  Map<String, int> stringIntMap = new Map<String, int>();
  stringIntMap["1"] = 1;
  stringIntMap.containsValue(true);
}
