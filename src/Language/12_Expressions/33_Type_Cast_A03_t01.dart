/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If T is malformed the cast always succeeds.
 * This is a consequence of the rule that malformed types are treated as dynamic
 * @description Checks that the cast succeeds if T is a parameterized type 
 * of the form G < T1, ..., Tn > and G is not a generic type with n type parameters.
 * @static-warning
 * @author rodionov 
 * @reviewer iefremov
 * @needsreview issue 3282
 */

main() {
  List<int, bool> x = [] as List<int, bool>;
}
