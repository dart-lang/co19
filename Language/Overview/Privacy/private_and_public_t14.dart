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
 * @description Checks that function parameter names can begin with an
 * underscore and are still accessible in the appropriate scope.
 * @author iefremov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

class A {
  fun(_, _$, ___) {return _ + _$ + ___;}
  static staticfun(_, _$, __) {return _ + _$ + __;}

  var _check;
  var __;
  A(_, _$, this.__) : _check = _ + _$ {}
  A.named(_, _$, ___) : _check = _ + _$ + ___ {}

  void set _setter(_) {__ = _;}
}


foo(var _x, int _) {
  return _x + _;
}

main() {
  Expect.equals(4, foo(2, 2));
  var a = new A(1, 2, 3);
  Expect.equals(3, a._check);
  Expect.equals(3, a.__);
  Expect.equals(6, new A.named(1, 2, 3)._check);
  a._setter = 54;
  Expect.equals(54, a.__);
  Expect.equals(6, A.staticfun(1, 2, 3));

  Expect.equals(1, ((_) => _)(1));
}
