/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart supports two levels of privacy: public and private.
 * A declaration is private iff its name is private, otherwise it is public.
 * A name q is private iff any one of the identifiers that comprise q is
 * private, otherwise it is public.
 * An identifier is private iff it begins with an underscore (the _ character)
 * otherwise it is public.
 * A declaration m is accessible to library L if m is declared in L or if m is
 * public.
 * @description Checks that local variables and functions names can begin with
 * an underscore and are still accessible in the same scope.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

f() {
  var _private_var = 1;
  return _private_var;
}

f2() {
  var _private_var = 1;
  _private_fun() {
    _private_var = 2;
    return _private_var;
  }
  return _private_fun;
}

f3() {
  return () => 54;
}

main() {
  Expect.equals(1, f());
  Expect.equals(2, f2()());
  Expect.equals(54, f3()());

  var i = 1;
  for (var _i in [1,2,3]) {
    Expect.equals(i++, _i);
  }
}
