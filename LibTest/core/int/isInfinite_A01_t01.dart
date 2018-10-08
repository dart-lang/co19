/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if the number represented by this int object is
 * infinite.
 * @description Checks that this method returns correct value (which is false
 * for any integer this type's value range does not include either infinity).
 * @author vasya
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  for (var i = -1000; i <= 1000; i++){
    Expect.isFalse(i.isInfinite);
  }
  
  Expect.isFalse(1844674407370955161.isInfinite);
  Expect.isFalse((-1844674407370955161).isInfinite);
}
