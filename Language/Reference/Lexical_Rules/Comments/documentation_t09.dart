/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Documentation comments are comments that begin with the tokens ///
 * or '/''*''*'.
 * @description Checks that a slash character followed by whitespace and two
 * more slashes does not make a documentation comment token.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 */

/ // Documentation comment

main() {
}
