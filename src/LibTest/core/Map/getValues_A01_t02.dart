/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a collection containing all the values in the map.
 * @description Check that returned collection is not backed by the map.
 * @author msyabro
 * @reviewer varlax
 */
 

main() {
  Map<String, Object> map = new Map<String, Object>();
  
  map["1"] = 1;
  map["2"] = 2;
  
  List a = map.getValues();
  
  //a.clear(); //Can't clear because returned list is unextendable
  //Expect.isTrue(map.length == 2);
  a[0] = 3;
  Expect.isTrue(!map.containsValue(3));
  
  a = map.getValues();
  map["3"] = 3;
  Expect.isTrue(a.length == 2);
  
  map.clear();
  Expect.isTrue(!a.isEmpty);
}
