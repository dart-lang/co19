/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Dart source text is represented as a sequence of Unicode code
 * points.
 * @description Checks that decomposed characters in comments do not cause
 * compile errors.
 * @author kaigorodov
 * @reviewer rodionov
 */

main() {
  String aWithRingAbove = "Å"; // Å
}
