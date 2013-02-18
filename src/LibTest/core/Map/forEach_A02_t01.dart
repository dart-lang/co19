/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to add or remove keys from the map during iteration.
 * @description Tries to remove or add entries in [f] while iterating over the map,
 * expects a ConcurrentModificationError every time regardless of whether or not
 * it is the current key that's being removed.
 * @author msyabro
 * @reviewer rodionov
 * @needsreview Doesn't specify the exact error, which operation throws it and whether
 * or not add/remove can finish successfully before the error. 
 */


main() {
  Map<String, Object> map = new Map<String, Object>();
  
  map["1"] = 3;
  map["2"] = 5;
  try {
    map.forEach((String key, Object value) {
      map["3"] = key;
    });
    Expect.fail("ConcurrentModificationError expected");
  } on ConcurrentModificationError catch(e) {}
  
  try {
    map.forEach((String key, Object value) {
      map.remove("2");
    });
    Expect.fail("ConcurrentModificationError expected");
  } on ConcurrentModificationError catch(e) {}

  try {
    map.forEach((String key, Object value) {
      map.remove(key);
    });
    Expect.fail("ConcurrentModificationError expected");
  } on ConcurrentModificationError catch(e) {}
  
  map["1"] = 1;
  map["2"] = 2;
  try {
    map.forEach((String key, Object value) {
      map.clear();
    });
    Expect.fail("ConcurrentModificationError expected");
  } on ConcurrentModificationError catch(e) {}
}
