/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a declaration d named n is in the namespace induced by a scope S, 
 * then d hides any declaration named n that is available in the lexically enclosing 
 * scope of S. 
 * As 15.2.1 Expressions/New states, a NoSuchMethodError should be thrown  because 'q is not defined'.
 * @description Checks that a hidden class name can't be used as a type.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 * @needsreview dart issue #21092
 */
import "../../Utils/expect.dart";

class C {}

main() {
  var C = 1;
  Expect.throws(() {
    new C(); /// static type warning
  }, (e) => e is NoSuchMethodError);
}
