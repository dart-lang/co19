/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let T be the static type of e and let f be the immediately
 * enclosing function.
 *    It is a static type warning if the body of f is marked async and the type
 * Future<flatten(T)> may not be assigned to the declared return type of f.
 * Otherwise, it is a static type warning if T may not be assigned to the
 * declared return type of f.
 *
 * @description Checks that compile error occurs if the type of e may
 * not be assigned to the declared return type of the immediately enclosing
 * function.
 *
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */
import '../../../Utils/dynamic_check.dart';

int foo() {
  return "0";
}

main() {
  foo();
}
