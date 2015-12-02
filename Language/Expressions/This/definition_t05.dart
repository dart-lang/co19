/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The reserved word this denotes the target of the current instance
 * member invocation.
 *   thisExpression:
 *     this
 *   ;
 * @description Checks that word 'this' cannot be used in a non-instance context.
 * @compile-error
 * @author hlodvig
 * @reviewer kaigorodov
 */

main() {
  try {
    var x = this;
  } catch (e) {}
}
