/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Passing null argument results in Error
 * @description Tries to pass null as argument and expects an Error
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {"".endsWith(null);});
}
