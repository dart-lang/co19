/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The expression !e is equivalent to the expression
 * e ? false : true.
 * @description Checks that, just like with conditional expressions, it is
 * a dynamic type error in checked mode when e is not a boolean and it is
 * subjected to a boolean conversion in scripting mode.
 * @author rodionov
 */
import '../../../Utils/expect.dart';
import '../../../Utils/dynamic_check.dart';

main() {
  var v = null;
  checkTypeError(() {Expect.isTrue(!v);});
  v = "true, honestly";
  checkTypeError(() {Expect.isTrue(!v);});
  v = () {};
  checkTypeError(() {Expect.isTrue(!v);});
}
