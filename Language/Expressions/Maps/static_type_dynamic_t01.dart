/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a map literal of the form
 * const {k1: e1 ... kn: en} or the form {k1: e1 ... kn: en } is
 * Map<dynamic, dynamic>.
 * @description Checks that static type of map literal with omitted type
 * arguments is indeed Map<dynamic, dynamic>. No static warnings expected.
 * @static-clean
 * @author ilya
 */

main() {
  Map x = {1: true, String: () {}};
  Map y = const {1: true, String: null};
}
