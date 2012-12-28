/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a collection containing all the values in the map.
 * @description Checks that collection of all values is returned.
 * @author msyabro
 * @reviewer varlax
 */
 

main() {
  Map<String, Object> map = new Map<String, Object>();
  
  Collection a = map.values;
  Expect.isTrue(a.length == 0);
  
  map["1"] = 1;
  map["2"] = 2;
  
  List arr = map.values;
  Expect.isTrue(arr.length == 2);
  Expect.isTrue(arr.indexOf(1,0) != -1 && arr.indexOf(2,0) != -1);
  
  map["3"] = 1;
  a = map.values;
  Expect.isTrue(a.length == 3);
  
  map.clear();
  a = map.values;
  Expect.isTrue(a.length == 0);
}
