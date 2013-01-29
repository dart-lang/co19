/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart supports two levels of privacy: public and private.
 * A declaration is private iff its name begins with an underscore (the _ character) 
 * otherwise it is public.
 * A declaration m is accessible to library L if m is declared in L or if m is public.
 * @description Checks that trying to access private instance class members from a script
 * that imports the library where the class is declared result in a NoSuchMethodError.
 * @static-warning
 * @author iefremov
 * @reviewer rodionov
 */

import "lib.dart";

check(f) {
  try {
    f();
    Expect.fail("NoSuchMethodError expected when trying to access a private member!");
  } on NoSuchMethodError catch(ok) {}
}

main() {
  var c = new ClassWithPrivateMembers();
  check(() {c._var = 1;});
  check(() {c._fun();}); /// static type warning
  check(() {print(c._finalvar);});
  check(() {print(c._getter);});
  check(() {c._setter = 1;});
}
