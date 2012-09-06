/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * Everything between // and the end of line must be ignored by the Dart compiler.
 * SINGLE LINE COMMENT:
 * '//' ~(NEWLINE)* (NEWLINE)?
 * ;
 * @description Checks that leading slash and backslash characters do not make a single-line comment.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 */

/\  Comment

main() {
}
