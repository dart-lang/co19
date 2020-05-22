/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an if-null expression e of the form e1??e2 is
 * equivalent ... The static type of e is least upper bound of the
 * static type of e1 and the static type of e2 .
 *
 * @description Check that static type of expression e1??e2 match with
 * static type (int) in assignment.
 *
 * @static-clean
 * @author a.semenov@unipro.ru
 */

main() {
  int? x = 1 ?? 2;
  num? y = 1 ?? 2.0;
  x = 2.0 ?? 1;          //# 01: compile-time error
  x = null ?? 1;
  x = null ?? null;
  x = 1 ?? null;
  x = 1 ?? 'aaa';        //# 02: compile-time error
  x = 'aaa' ?? 1;        //# 03: compile-time error
  x = 'aaa' ?? true;     //# 04: compile-time error
  return x;
}

