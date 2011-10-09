/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Read-only length of the array.
 * @description Checks that the field is read-only.
 * @author iefremov
 * @runtime-error
 * @reviewer msyabro
 */


main() {
  [].length = 1;
}
