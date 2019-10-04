/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let e be a setOrMapLiteral.
 * If e has a context C, and the base type of C is Cbase (that is, Cbase is C
 * with all wrapping FutureOrs removed), and Cbase is not ?, then let S be the
 * greatest closure.
 * ...
 * If leaf elements has at least one mapEntry and at least one
 * expressionElement, report a compile-time error.
 *
 * @description Checks that it is a compile-time error if leaf elements has at
 * least one mapEntry and at least one expressionElement
 * @author sgrekhov@unipro.ru
 */
main() {
  var map = {1: "Let", 2: "it", 3: "be"};
  var set = {"Let", "it", "be"};

  var c1 = {if (2 > 1) ...map, if (1 < 2) ...set};    //# 01: compile-time error
  var c2 = {if (2 > 1) ...set else ...map};           //# 02: compile-time error
  var c3 = {if (2 > 1) ...set else ...set, if (2 > 1) ...map};                          //# 03: compile-time error
  var c4 = {for (var i = 0; i < 3; i++) if (2 > 1) ...set else if (2 > 1) ...map};      //# 04: compile-time error
  var c5 = {for (var i in [1, 2, 3]) if (1 > 2) ...map else if (2 > 1) ...set};         //# 05: compile-time error
  var c6 = {if (1 > 2) for (var i in [1, 2, 3]) ...set else if (2 > 1) for (var i = 0; i < 3; i++) ...map};   //# 06: compile-time error
  var c7 = {if (2 > 1) for (var i in [1, 2, 3]) ...map else if (2 > 1) for (var i = 0; i < 3; i++) ...set};   //# 07: compile-time error
}
