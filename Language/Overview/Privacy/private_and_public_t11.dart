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
 * @description Checks that various private class members are perfectly 
 * accessible to a subclass that is declared in the same script.
 * @author iefremov
 * @reviewer kaigorodov
 */
import "../../../Utils/expect.dart";

abstract class _A {
  var _var = 54;
  static var _staticvar = "abyrvalg";
  final _finalvar = "final!";

  _fun() {return 42;}
  static _staticfun() {return 54;}
  _abstractfun();

  _A() {}
  _A.named() {}
  factory _A.fctry() {throw 2;}

  get _getter {return 100500;}
  void set _setter(x) {throw 1;}
}

class B extends _A {
  _abstractfun() {}

  test() {
    Expect.equals(54, super._var);
    Expect.equals(54, _var);
    Expect.equals("abyrvalg", _A._staticvar);
    Expect.equals("final!", super._finalvar);
    Expect.equals("final!", _finalvar);

    Expect.equals(42, super._fun());
    Expect.equals(42, _fun());
    Expect.equals(54, _A._staticfun());

    _abstractfun();
    try {
      super._abstractfun();
      Expect.fail("NoSuchMethodError expected.");
    } on NoSuchMethodError catch (ok) {}

    Expect.equals(100500, _getter);
    Expect.equals(100500, super._getter);
    try {
      _setter = 1;
    } on int catch (ok) {
      Expect.equals(1, ok);
    }
    try {
      super._setter = 1;
    } on int catch (ok) {
      Expect.equals(1, ok);
    }
  }
}

main() {
  new B().test();
}
