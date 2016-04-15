/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A single line comment begins with the token //.
 * Everything between // and the end of line must be ignored by the Dart
 * compiler unless the comment is a documentation comment.
 * SINGLE LINE COMMENT:
 *   '//' ~(NEWLINE)* (NEWLINE)?
 * ;
 * @description Checks that a multi-line comment start token is ignored if it
 * is contained in a single-line comment.
 * @compile-error
 * @author hlodvig
 * @reviewer rodionov
 */

main() {
  // single line comment /*
	 * multi-line comment
	 */
}
