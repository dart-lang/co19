// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a class declares two members of
/// the same name.
/// ...
/// The name of a setter is obtained by appending the string ‘=’ to
/// the identifier given in its signature.
/// Hence, a setter name can never conflict with, override or be overridden by
/// a getter or method.
///
/// @description Checks that a class can declare a getter and a setter of the
/// same name provided both are instance members (abstract or not) or both are
/// static members.
/// @author msyabro

abstract class A {
  static var _sVal;
  static get sVal {}
  static set sVal(value) {}

  var _val;
  get val {}
  set val(value) {}

  get aVal;
  set aVal(val);

  get bVal {}
  set bVal(val);

  get cVal;
  void set cVal(val) {}
}

class B extends A {
  get aVal {}
  set aVal(val) {}
  set bVal(val) {}
  get cVal {}
}

main() {
  A a = B();
  var x = a.bVal;
  a.bVal = x;
  x = a.aVal;
  a.aVal = x;
}
