/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A block statement supports sequencing of code.
 * Execution of a block statement { s1, ... , sn } proceeds as follows:
 * For i in 1..n; si is executed.
 * @description Checks that it is not an error if a block statement has empty
 * contents.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

main() {
  { }
  {{{ }{ }{ }{ }{ }{ }{ }{ { }{ }{ }{ { }{ { }}}} } }
  {{{{{{{{ { { { { { { { { { { { { { { { { { { { { { { { { { { { { { { { { { {
  }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}} }
}

