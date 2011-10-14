/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Concatenates all the given strings to create a new string.
 * @description Tries to pass a list with elements that aren't String
 * @static-type-error
 * @author msyabro
 * @reviewer rodionov
 */

main() {

  String str = Strings.concatAll([ "1", 2 ]);

  str = Strings.concatAll([ 1, "2", 3 ]);

  str = Strings.concatAll([ "1", 2.0, (3/0.0) ]);
}
