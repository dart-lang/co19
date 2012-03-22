/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An import specifies a URI where the declaration of the imported library
 * is to be found. The effect of an import of library B with prefix P within the
 * declaration of library A is:
 * - If P is the empty string, each non-private top level declaration d of B is
 * added to the scope of A.
 * - Otherwise, each non-private top level declaration d of B is added to the
 * scope of A under the name P.d, as is the name P.
 * @description Checks that names imported from library B with prefix P can't
 * be used without prefix.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

#import("1_Imports_A02_lib.dart", prefix: 'P');

main() {
  try {
    aFoo === 'A_FOO';
  } catch(var e) {}
}
