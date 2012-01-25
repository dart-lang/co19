/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a class declares two members of the same name,
 * except that a getter and a setter may be declared with the same name provided
 * both are instance members or both are static members.
 * @description Checks that a class can declare a getter and a setter of the same name provided
 * both are instance members (abstract or not) or both are static members.
 * @author msyabro
 * @reviewer rodionov
 */

class A {
  static var _sVal;
  static get sVal() {}
  static set sVal(var value) {}

  var _val;
  get val() {}
  set val(var value) {}
  
  abstract get aVal();
  abstract set aVal(var val);

  get bVal() {}
  abstract set bVal(var val);

  abstract get cVal();
  void set cVal(var val) {}
}

main() {
  A a = new A();
}