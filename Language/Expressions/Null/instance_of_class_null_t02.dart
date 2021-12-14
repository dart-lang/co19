// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The null object is the sole instance of the built-in class Null.
/// @description Checks that type of null is Null type.
/// @author ngl@unipro.ru

import '../../../Utils/expect.dart';

class A {}

main() {
  var n = null;
  checkType(checkIs<Type>, true, Null);
  checkType(checkIs<Null>, true, null);
  checkType(checkIs<Null>, true, n);
  checkType(checkIs<A>, false, null);
  checkType(checkIs<A>, false, n);
}
