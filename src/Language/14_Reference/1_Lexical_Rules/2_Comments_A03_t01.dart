/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Documentation comments are multi-line comments that begin with the tokens '/''*''*'.
 * Inside a documentation comment, the Dart compiler ignores all text unless it is 
 * enclosed in brackets.
 * @description Checks that slash and two asterisk characters separated by whitespace do not
 * make a documentation comment start token (or any other kind of comment).
 * @author vasya
 * @compile-error
 * @reviewer rodionov
 */

/ 
	**
 * Documentation comment
 */

main() {
}
