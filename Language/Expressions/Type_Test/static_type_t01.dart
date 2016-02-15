/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of an is-expression is bool.
 * @description Checks that the static checker does not raise warnings when
 * assigning the result of the is-expression to bool variables.
 * @static-clean
 * @author msyabro
 * @reviewer kaigorodov
 */

main() {
  bool e = 1 is int;
  e = 1 is String;
  e = 1 is! bool;
  e = 1 is! Object;
}
