/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Length is read-only field.//??
 * @description Check that field is read only
 * @runtime-error
 * @author msyabro
 * @reviewer rodionov
 */


main() {
  "".length = 1;
}
