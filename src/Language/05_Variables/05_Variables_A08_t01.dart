/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A top level variable marked final must be initialized to a compile-time 
 * constant or a compile-time error occurs. 
 * @description Checks that it is a compile-time error occurs if a top level variable
 * marked final is not initialized to a compile-time constant.
 * @author vasya
 * @reviewer kaigorodov
 * @reviewer iefremov
 * @compile-error
 */

final foo = new List(); // error

main() {
  try {
    Expect.isTrue(foo is List);
  } catch(var x){}
}

