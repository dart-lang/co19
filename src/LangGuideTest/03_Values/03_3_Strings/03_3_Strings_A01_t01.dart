/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion There is a way to write string-literals by enclosing characters with single
 * or double-quotes. Strings that are expressed in this form are subject to interpretation
 * of meta characters and support string-interpolation (see String Interpolation).
 * @description Checks that sequence of characters enclosed in single or double-quotes
 * is a valid literal.
 * @author pagolubev
 * @reviewer akuznecov
 * @needsreview Here we also can check type of string literal. 
 */


main() {
  "foo";
  'bar';
}
