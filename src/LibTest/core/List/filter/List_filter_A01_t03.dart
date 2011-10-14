/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a new list with the elements of this list that satisfy the predicate [f].
 * @description Checks this method behavior when this list is empty.
 * @author iefremov
 * @reviewer pagolubev
 * @reviewer msyabro
 */


main() {
  var a = [].filter(bool f(var v){return true;});
  Expect.isTrue(a.isEmpty());
  a = [].filter(bool f(var v){Expect.fail("Should not be executed");});
  Expect.isTrue(a.isEmpty());
}
