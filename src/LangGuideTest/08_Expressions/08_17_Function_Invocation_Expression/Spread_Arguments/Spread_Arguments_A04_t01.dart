/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The spread operator cannot be used with named arguments. 
 * @description Check that spread operator can not be used with named arguments
 * @compile-error
 * @author msyabro
 * @needsreview add another test "[] ...args"
 */

void func([...args]) {}

void main() {}