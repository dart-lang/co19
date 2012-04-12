/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Documentation comments are multi-line comments that begin with the tokens '/''*''*'.
 * Inside a documentation comment, the Dart compiler ignores all text unless it is 
 * enclosed in brackets.
 * @description Checks that asterisk and slash characters separated by whitespace do not
 * make a documentation comment end token.
 * @author vasya
 * @compile-error
 * @reviewer rodionov
 */

/**
 * Documentation comment
 *	
 /

main() {
}
