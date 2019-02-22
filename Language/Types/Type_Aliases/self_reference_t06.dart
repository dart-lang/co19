/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any self reference in a typedef, either directly, or recursively
 * via another typedef, is a compile time error.
 * @description Checks that generic type in a typedef declaration can
 * be used inside that declaration as the name of a type or as a name
 * of a positional optional parameter without errors or warnings.
 * @author iefremov
 */

typedef F<F>([F f]);

main() {
  null is F;
}
