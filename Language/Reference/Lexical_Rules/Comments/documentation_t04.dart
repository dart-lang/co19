/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Documentation comments are comments that begin with the tokens ///
 * or '/''*''*'.
 * @description Checks that it is a compile-time error when a documentation
 * comment does not have the end token, regardless of whether or not it contains
 * single- and multi-line comment start tokens.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 */

/**
 * Documentation comment
 /*

main() {
}
