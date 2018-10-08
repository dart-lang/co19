/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws Error if [other] is null
 * @description Checks that Error is thrown if the argument is null.
 * @author msyabro
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  Expect.throws(() {
    new HashMap.from(null);
    },
    (e)=> e is Error
  );
}
