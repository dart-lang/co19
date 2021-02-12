/*
 * Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Struct()
 *  Construct a reference to the nullptr.
 *
 * @description Checks that this constructor constructs a reference to the
 * nullptr.
 * @author sgrekhov@unipro.ru
 * @issue 44987
 */
import "dart:ffi";
import "../../../Utils/expect.dart";

class S1 extends Struct {
  S1() : super();
}

void main() {
  S1 s1 = new S1();
  Expect.equals(nullptr.address, s1.addressOf.address);
}
