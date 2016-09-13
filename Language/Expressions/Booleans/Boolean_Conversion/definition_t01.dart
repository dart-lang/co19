/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Boolean conversion is defined by the function
 *   (bool v){
 *      assert(v != null);
 *      return identical(v, true);
 *    }(o)
 * @description Checks that AssertionError is thrown when trying to convert
 * null to bool if asserts are enabled.
 * @author msyabro
 * @issue 27277
 */
import '../../../../Utils/expect.dart';

main() {
  Expect.throws(() {if (null) {}}, (e) => e is AssertionError);
}
