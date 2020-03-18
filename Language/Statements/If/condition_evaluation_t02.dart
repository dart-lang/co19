/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of an if statement of the form if (b) s1 else s2
 * proceeds as follows:
 * First, the expression b is evaluated to an object o. Then, o is subjected to
 * boolean conversion, producing an object r.
 * @description Checks that it an AssertionError (see  Boolean conversion)
 * is thrown if the expression evaluates to null.
 * @author kaigorodov
 */
import '../../../Utils/expect.dart';

main() {
  var i = null;
  Expect.throws(() {if (i) {i = "hello";}}, (e) => e is TypeError);
}
