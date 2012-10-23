/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In checked mode, it is a dynamic type error if o is not null and
 * the runtime type of o is not a subtype of the actual return type
 * of the immediately enclosing function.
 * @description Checks that in checked mode, it not a dynamic type error if o is null.
 * @author kaigorodov
 */

var r=null;

int foo() {  return r; }

main() {
  var res=foo();
}
