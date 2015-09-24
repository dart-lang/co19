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
 * @description Checks that private fields/methods inherited from a class 
 * declared in another library are not visible and do not overload members 
 * from a super class declared in the current library.
 * @author iefremov
 * @reviewer rodionov
 */
library private_and_public_t21;
import "../../../Utils/expect.dart";
import "private_and_public_t21_lib.dart";

class A {
  var _var = 54;
  _func() {return 42;}
}

class C extends B {
  test() {
    Expect.equals(54, _var);
    Expect.equals(42, _func());
  }
}

main() {
  new C().test();
}
