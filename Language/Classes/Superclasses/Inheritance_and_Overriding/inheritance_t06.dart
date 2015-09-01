/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class C inherits any accessible instance members of its superclass that
 * are not overridden by members declared in C. A class may override instance members
 * that would otherwise have been inherited from its superclass.
 * @description Checks that inaccessible instance members are not inherited.
 * @author kaigorodov
 * @reviewer rodionov
 */
import "../../../../Utils/expect.dart";

import "inheritance_t06.lib.dart" as lib;

class C extends lib.Foreign {}

main() {
  var c = new C();
  Expect.throws(() => c._var, (e) => e is NoSuchMethodError);
  Expect.throws(() => c._m, (e) => e is NoSuchMethodError);
}
