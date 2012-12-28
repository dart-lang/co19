/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a collection containing all the keys in the map.
 * @description Check that returned collection is not backed by the map.
 * @author msyabro
 * @reviewer varlax
 */
 

main() {
  Map<String, Object> map = new Map<String, Object>();
  
  map["1"] = 1;
  map["2"] = 2;
  
  List a = map.keys;
  
  a[1] = "3";
  Expect.isTrue(map["3"] == null);
  Expect.isTrue(map.containsKey("1"));
  
  map.remove("2");
  Expect.isTrue(a.length == 2);
  Expect.isTrue(!map.containsKey("2"));
  
  //a.clear();    //Can't clear because returned list is unextendable
  //Expect.isTrue(!map.isEmpty);
}
