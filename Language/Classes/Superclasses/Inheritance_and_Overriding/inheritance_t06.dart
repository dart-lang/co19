/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let C be a class, let A be a superclass of C, and let S1...Sk
 * be superclasses of C that are also subclasses of A. C inherits all
 * accessible instance members of A that have not been overridden by a
 * declaration in C or in at least one of S1...Sk.
 * A class may override instance members that would otherwise have been
 * inherited from its superclass.
 * @description Checks that inaccessible instance members are not inherited.
 * @compile-error
 * @author kaigorodov
 */

import "inheritance_t06.lib.dart" as lib;

class C extends lib.Foreign {}

main() {
  var c = new C();
  c._var;
  c._m;
}
