/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The [topLevelFunction] argument must be a static top-level function
 * or a static method that takes no arguments. It is illegal to pass a function closure.
 * @description Checks that method throws an exception when passed an instance method,
 * a local function or a closure with no arguments. 
 * @author iefremov
 * @needsreview documentation looks incomplete
 */
import "../../../Utils/expect.dart";

import "dart:isolate";

class A {
  m() {}
}

main() {
  var x = () {};

  Expect.throws(() {spawnFunction(x);});
  Expect.throws(() {spawnFunction(() {});});
  Expect.throws(() {spawnFunction(new A().m);});
}
