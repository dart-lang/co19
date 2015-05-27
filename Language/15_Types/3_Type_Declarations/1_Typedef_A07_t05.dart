/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any self reference in a typedef, either directly, or recursively
 * via another typedef, is a compile time error.
 * @description Checks that the name introduced by a typedef declaration can be used inside
 * that declaration as the name of a type argument or as a name of a formal parameter without
 * errors or warnings.
 * @author iefremov
 * @reviewer rodionov
 */

typedef f<f>(f);

main() {
  null is f;
}
