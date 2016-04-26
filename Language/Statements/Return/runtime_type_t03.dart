/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let S be the runtime type of o. In checked mode:
 *    • If the body of f is marked async it is a dynamic type error if o is not
 * null and Future<S> is not a subtype of the actual return type of f.
 *    • Otherwise, it is a dynamic type error if o is not null and the runtime type
 * of o is not a subtype of the actual return type of f.
 *
 * @description Checks that it's not an error in any mode if S is subtype of
 * the actual return type of f.
 *
 * @author a.semenov@unipro.tu
  */

var r = 3.14;

num foo() { return r; }

main() {
  foo();
}
