/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function expression invocation i has the form
 * ef(a1, ..., an, xn+1: an+1, ..., xn+k: an+k), where ef is an expression. If
 * ef is an identifier id, then id must necessarily denote a local function,
 * a library function, a library or static getter or a variable as described
 * above, or i is not considered a function expression invocation.
 * @description Checks that the function invocation produces expected results
 * when the expression is an identifier denoting a local function, a library
 * function, a library or static getter or a variable.
 * @static-clean
 * @author msyabro
 * @reviewer rodionov
 * @note no static warnings are expected: static type of non-Function
 * getters/variables is Dynamic
 */
import '../../../../Utils/expect.dart';

libfunc() {
  return "libfunc";
}

get libgetter {
  return () => "libgetter";
}
get libgetter2 {
  return "libgetter2";
}

class Foo {
  static get staticgetter {
    return () => "staticgetter";
  }

  static get staticgetter2 {
    return "staticgetter2";
  }

  test() {
    Expect.equals("staticgetter", staticgetter());

    try {
      staticgetter2();
      Expect.fail("NoSuchMethodError expected");
    } on NoSuchMethodError catch (ok) {}
  }
}


main() {
  var varfunc = (() => "varfunc");
  Expect.equals("varfunc", varfunc());

  dynamic varnotfunc = 1;
  try {
    varnotfunc();
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch (ok) {}

  localfunc() {
    return "localfunc";
  }
  Expect.equals("localfunc", localfunc());

  new Foo().test();

  Expect.equals("libgetter", libgetter());

  try {
    libgetter2();
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch (ok) {}

  Expect.equals("libfunc", libfunc());
}
