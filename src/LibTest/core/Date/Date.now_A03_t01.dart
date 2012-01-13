/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Date.now() is not a const constructor
 * @description Checks that Date.now constructor cannot be [:const:] 
 * @compile-error
 * @author hlodvig
 * @reviewer msyabro
 */

main() {
  Date d = const Date.now();
}
  