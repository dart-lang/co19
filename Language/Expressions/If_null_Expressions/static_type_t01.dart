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
 * @author a.semenov@unipro.ru
 */

main() {
  int? x = null ?? 2;
  num? y = x ?? 2.0;
  double? d = 3.14;
  String? s = "Lily was here";
  x = d ?? 1;          //# 01: compile-time error
  x = null ?? 1;
  x = null ?? null;
  x = x ?? 'aaa';        //# 02: compile-time error
  x = s ?? 1;        //# 03: compile-time error
  x = s ?? true;     //# 04: compile-time error
  return x;
}

