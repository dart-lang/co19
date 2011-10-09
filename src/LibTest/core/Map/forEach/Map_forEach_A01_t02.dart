/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Applies [f] to each {key, value} pair of the map.
 * @description Try to pass not Function object as [f] and check that ObjectNotClosureException is thrown.
 * @author msyabro
 * @reviewer varlax
 * @needsreview undocumented
 */


main() {
  Map<String, Object> map = new Map<String, Object>();
  
  map["1"] = 3;
  map["2"] = 5;
  
  int x;
  
  try {
    map.forEach(null);
    Expect.fail("ObjectNotClosureException is expecpected");
  } catch(ObjectNotClosureException e) {}
  
  try {
    map.forEach(x);
    Expect.fail("ObjectNotClosureException is expected");
  } catch(ObjectNotClosureException e) {}
}
