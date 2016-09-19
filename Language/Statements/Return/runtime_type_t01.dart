/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let S be the runtime type of o. In checked mode:
 *    • If the body of f is marked async it is a dynamic type error if o is not
 * null and Future<S> is not a subtype of the actual return type of f.
 *    • Otherwise, it is a dynamic type error if o is not null and the runtime
 * type of o is not a subtype of the actual return type of f.
 *
 * @description Checks that compile error is raised if o is not null and
 * the runtime type of o is not a subtype of the actual return type
 * of the immediately enclosing function.
 *
 * @compile-error
 * @author kaigorodov
 * @reviewer rodionov
 */

import '../../../Utils/dynamic_check.dart';

var r = 'a';

int foo() { return r; }

main() {
  foo();
}
