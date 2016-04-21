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
 * @description Check that static type of expression e1??e2 do not match with
 * static type int in assignment
 *
 * @static-warning
 * @author a.semenov@unipro.ru
 *
 */
import 'dart:collection';
import '../../../Utils/dynamic_check.dart';

main() {
  checkTypeError(() {int x = 1.0 ?? 2.0; return x;}); /// static type warning
  checkTypeError(() {int x = null ?? 2.0; return x;}); /// static type warning
  checkTypeError(() {int x = 'aaa' ?? 'bbb'; return x;}); /// static type warning
  checkTypeError(() {int x = true ?? false; return x;}); /// static type warning
  checkTypeError(() {
    int x = new LinkedHashMap() ?? new SplayTreeMap(); /// static type warning
    return x;
  });
  checkTypeError(() {int x = 'aaa' ?? null; return x;}); /// static type warning
}

