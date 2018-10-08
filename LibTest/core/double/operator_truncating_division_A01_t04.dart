/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int operator ~/(num other)
 * @description Checks that if both operands are infinite the result is an error
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {
    double.infinity ~/ double.infinity;
  });
  
  Expect.throws(() {
    double.infinity ~/ double.negativeInfinity;
  });
  
  Expect.throws(() {
    double.negativeInfinity ~/ double.infinity;
  });
  
  Expect.throws(() {
    double.negativeInfinity ~/ double.negativeInfinity;
  });
}
