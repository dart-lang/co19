/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of null is ⊥.
 * The decision to use ⊥ instead of Null allows null to be be assigned
 * everywhere without complaint by the static checker.
 * @description Checks that null is assignable to any type without static
 * type warnings.
 * @static-clean
 * @author hlodvig
 * @reviewer iefremov
 * @reviewer rodionov
 */

class A {}

typedef F();

main() {
  var v = null;
  int i = null;
  String s = null;
  A a = null;
  Object o = null;
  F f = null;
  List<List> l = null;
}
