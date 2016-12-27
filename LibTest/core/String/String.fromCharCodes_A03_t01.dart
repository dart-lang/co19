/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws Error if [charCodes] is null.
 * @description Checks that an Error is thrown when the argument is null.
 * @author msyabro
 */
import "../../../Utils/expect.dart";


main() {
  Expect.throws(() {new String.fromCharCodes(null);}, (e) => e is Error);
}
