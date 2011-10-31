/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Static type annotations are used during static checking and when running programs in
 * checked mode. They have no effect whatsoever in production mode.
 * @description Checks that static type annotation has no effect in scripting mode.
 * @author iefremov
 * @needsreview TODO: Need scripting mode support!
 */

main() {
  String foo = "foo";
  List bar = foo;
  int numb3r = "not really";
}
