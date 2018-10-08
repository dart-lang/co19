/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static type warning if the type of e may not be assigned
 * to either bool or () -> bool.
 * @description Checks that it is not a static type warning if the static type
 * of e is () -> Object (conditional expression).
 * @author ngl@unipro.ru
 */

main() {
  assert (true ? true : false);
}
