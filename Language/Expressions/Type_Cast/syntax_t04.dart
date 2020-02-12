/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The cast expression ensures that an object is a member of a type.
 * typeCast:
 *   asOperator type
 * ;
 * asOperator:
 *   as
 * ;
 * @description Checks that it is not a compile-time error when the first
 * argument of a type cast operator is a type literal.
 * @author rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

main() {
  try {
    int as num;
    Expect.fail("CastError expected");
  } on CastError catch (e) {}
  on TypeError catch (e) {}
}
