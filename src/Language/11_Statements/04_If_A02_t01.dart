/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of an if statement of the form if(b) s1 else s2 proceeds as follows:
 * The expression b is evaluated to an object o.
 * In checked mode, it is a dynamic type error if o is not of type bool.
 * @description Checks that it is a dynamic type error if the expression
 * does not evaluate to a value of type bool in checked mode.
 * @static-warning
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

#import("../../Utils/dynamic_check.dart");

main() {
  var i;
  checkTypeError(() {
    var o = 1;
    if (o) {i = "hello";}
  });
}
