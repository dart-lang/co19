/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Joins all the given strings to create a new string.
 * @description Try to pass array with not String objects
 * @static-type-error
 * @author msyabro
 * @needsreview test finishes without any output, but any code after
 * String str = Strings.join([1, 2, 3], "");
 * will not be executed
 */


main() {
  String str = Strings.join([1, 2, 3], "");
}
