/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a declaration d named n is in the namespace induced by a scope S, 
 * then d hides any declaration named n that is available in the lexically enclosing 
 * scope of S. 
 * @description Checks that a hidden function type alias name can't be used as a type.
 * @author msyabro
 * @reviewer iefremov
 * @issue 6028
 */

import "../../Utils/dynamic_check.dart";

typedef func();

main() {
  var func = 1;
  checkTypeError( () {
    func f = () => null; /// static type warning - see "Assignment"
  });
}
