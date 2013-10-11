/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E removeAt(int index)
 * Throws an ArgumentError if index is not an int.
 * @description Checks that an ArgumentError is thrown if index is not an int.
 * @author kaigorodov
 * @needsreview issue #14013
 */
import "removeAt_A02_t01.test.dart";

List create([int length=null]) {
  if (length==null) {
    return new List();
  } else {
    return new List(length);
  }
}  

main() {
  test(create);
}
