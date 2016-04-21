/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */

library Library;

class AccessibleClass {}
typedef int accessibleFuncType();
var accessibleVariable;
accessibleFunction() {}

class _InaccessibleClass {}
typedef _inaccessibleFuncType(p1);
var _inaccessibleVariable;
_inaccessibleFunction() {}


class ClassWithPrivateMembers {
  ClassWithPrivateMembers() {}
  ClassWithPrivateMembers._named() {}
  factory ClassWithPrivateMembers._named2() {}

  var _var = 54;
  static var _staticvar = "abyrvalg";
  final _finalvar = "final!";

  _fun() {return 42;}
  static _staticfun() {return 54;}

  get _getter {return 100500;}
  void set _setter(x) {throw 1;}
}
