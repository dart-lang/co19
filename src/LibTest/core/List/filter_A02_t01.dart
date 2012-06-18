/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns empty collection if no matching elements is found.
 * @description Checks that the given function is not executed and an empty
 * collection is returned if the list is empty.
 * @author iefremov
 * @reviewer pagolubev
 * @reviewer msyabro
 */


main() {
  var a = [].filter(bool f(var v){return true;});
  Expect.isTrue(a.isEmpty());
  a = [].filter(bool f(var v){Expect.fail("Should not be executed");});
  Expect.isTrue(a.isEmpty());
  a = const [].filter(bool f(var v){Expect.fail("Should not be executed");});
  Expect.isTrue(a.isEmpty());
  a = new List().filter(bool f(var v){Expect.fail("Should not be executed");});
  Expect.isTrue(a.isEmpty());
  a = new List.from([]).filter(bool f(var v){Expect.fail("Should not be executed");});
  Expect.isTrue(a.isEmpty());
}
