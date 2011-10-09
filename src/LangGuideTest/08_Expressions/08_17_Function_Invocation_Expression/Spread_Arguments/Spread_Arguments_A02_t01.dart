/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In order to pass arguments on to another function that accepts a variable number of arguments,
 * function must be able to spread (or unfold) the array. This is accomplished with the spread operator "..." .
 * @description Check that spread operator is a valid operator
 * @author msyabro
 */

void func2(...args) {}
void func(... args){
    func2(...args);
}

void main() {}
