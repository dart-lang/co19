/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A cascaded method invocation expression of the form e..suffix
 * is equivalent to the expression (t){t.suffix; return t;}(e).
 * @description Checks that if evaluation of suffix raises an exception
 * a cascaded invocation raises the same exception.
 * @author msyabro
 * @reviewer iefremov
 */

class C {}

main() {
  var o = new C();
  try {
    var result = o..method();
    Expect.fail('NoSuchMethodError is expected');
  } on NoSuchMethodError catch(e) {}
}

