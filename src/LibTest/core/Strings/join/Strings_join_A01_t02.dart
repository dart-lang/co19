/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Joins all the given strings to create a new string.
 * @description Tries to pass a list containing elements that aren't String
 * @static-type-error
 * @author msyabro
 * @reviewer rodionov
 */


main() {
  Strings.join(["1", 2], "");
}
