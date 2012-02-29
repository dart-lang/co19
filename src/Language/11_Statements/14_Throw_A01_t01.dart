/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The throw statement is used to raise or re-raise an exception.
 * throwStatement:
 * throw expression? ';'
 * ;
 * @description Checks that it is a compile-time error when the throw statement 
 * does not end with a semicolon.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */


main() {
  try {
    throw "fail"
  } catch (var e) { }
}
