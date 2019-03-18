/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If s is a set literal, then it has the form
 * const? ('<' type '>')? '{' ... '}' where ... is zero or more comma-separated
 * element expressions (potentially with a trailing comma which is otherwise
 * ignored).
 * @description Checks set literal syntax
 * @author sgrekhov@unipro.ru
 */
main() {
  var v1  = const <int> {,};  //# 01: compile-time error
  var v2  = const {,};        //# 02: compile-time error
  var v3  = {,};              //# 03: compile-time error
  var v4  = const <int> {,,}; //# 04: compile-time error
  var v5  = const {,,};       //# 05: compile-time error
  var v6  = {,,};             //# 06: compile-time error
}
