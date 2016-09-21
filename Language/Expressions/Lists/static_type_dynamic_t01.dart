/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type a list literal of the form const [e1...en] or
 * the form [e1...en] is List<dynamic>.
 * @description Checks that static type of list literal with omitted type
 * argument is indeed List<dynamic> by assigning it to declared variable of
 * type List<dynamic>. No static warnings expected.
 * @static-clean
 * @author ilya
 */

main() {
  List x = [0, true, String];
  List y = const [0, true, String];
}
