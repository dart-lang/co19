/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion getter definition that is prefixed with the static modifier defines
 * a static getter
 * @description Checks that non-static getter cannot be called as static one
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

class C1 {
  int get g1 => 0;
  get g2 => null;
}

class C2 extends C1 {
  int get g3 => 0;
}

main() {
  Expect.throws(() {var x = C1.g1;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {var x = C1.g2;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {var x = C2.g1;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {var x = C2.g2;}, (e) => e is NoSuchMethodError);
  Expect.throws(() {var x = C2.g3;}, (e) => e is NoSuchMethodError);
}
