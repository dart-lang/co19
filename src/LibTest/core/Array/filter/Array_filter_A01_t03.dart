/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a new array with the elements of this array that satisfy the predicate [f]. 
 * @description Checks method behavior with empty arrays.
 * @author iefremov
 * @reviewer pagolubev
 */


main() {
  var a = [].filter(bool f(var v){return true;});
  Expect.isTrue(a.isEmpty());
}
