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
 * accessible inside the library where the class is declared.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

class _A {
  var _var = 54;
  static var _staticvar = "abyrvalg";
  final _finalvar = "final!";

  _fun() {return 42;}
  static _staticfun() {return 54;}

  _A() {}
  _A.named() {}
  _A._named() {}
  factory _A.fctry() {throw 2;}

  get _getter {return 100500;}
  void set _setter(x) {throw 1;}
}

main() {
  _A a = new _A();
  Expect.equals(54, a._var);
  Expect.equals("abyrvalg", _A._staticvar);
  Expect.equals("final!", a._finalvar);

  Expect.equals(42, a._fun());
  Expect.equals(54, _A._staticfun());

  a = new _A.named();
  Expect.equals(100500, a._getter);

  a = new _A._named();
  Expect.equals(100500, a._getter);

  try {
    a._setter = 1;
  } on int catch (ok) {}

  try {
    new _A.fctry();
  } on int catch (ok) {}
}
