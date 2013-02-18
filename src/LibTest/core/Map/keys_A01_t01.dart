/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns an Iterable containing all the keys in the map.
 * @description Checks that an Iterable containing all keys is returned.
 * @author msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

main() {
  Map<String, Object> map = new Map<String, Object>();
  
  Iterable a = map.keys;
  Expect.isTrue(a.length == 0);
  
  map["1"] = 1;
  map["2"] = 2;
  
  Iterable arr = map.keys;
  Expect.isTrue(arr.length == 2);
  Expect.isTrue(arr.contains("1"));
  Expect.isTrue(arr.contains("2"));
  
  map.clear();
  a = map.keys;
  Expect.isTrue(a.length == 0);
}
