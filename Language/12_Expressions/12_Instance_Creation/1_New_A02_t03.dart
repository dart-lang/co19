/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let e be a new expression of the form
 * new T.id(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k) or the form
 * new T(a1, ... , an, xn+1 : an+1, ... , xn+k : an+k).
 * @description Checks that it is a dynamic error if a reference to
 * a top-level function is used as a Type.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 */
import "../../../Utils/expect.dart";

func() {}

main() {
  try {
    new func();
    Expect.fail("Runtime error expected");
  } on Error catch(e) {}
}
