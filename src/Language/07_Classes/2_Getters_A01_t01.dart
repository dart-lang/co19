/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * getterSignature:
 *   static? returnType? get identifier
 * ;
 * @description Checks that various valid getter declarations are parsed correctly.
 * @static-warning
 * @author iefremov
 * @reviewer pagolubev
 * @reviewer rodionov
 */

class C<U, V> {
  static int get g1 => null;
  int get g2 => null;
  get g3 => null;
  static get g4 => null;

  int get g5;
  get g6;

  U get g7 => null;
  get g8 => null;
  V get g9;
  get g10;
}

main() {
  var x;
  x = C.g1;
  x = new C().g2;
  x = new C().g3;
  x = C.g4;

  x = new C<C, C>().g7;
  x = new C<int, double>().g8;
}

