/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if every element of the array satisfy the predicate [f]. Returns false otherwise. 
 * @description Checks calling the method on an empty array.
 * @author iefremov
 * @needsreview 
 * @reviewer pagolubev
 */


main() {
    Expect.isTrue([].every(bool f(var v) {return true;}));
    Expect.isTrue([].every(bool f(var v) {return false;}));  
  }
