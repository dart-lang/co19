/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Class may extend another class (single inheritance).
 * @description Checks that multiple inheritance is not allowed.
 * @author iefremov
 * @compile-error 
 * @reviewer msyabro
 */

class C1 {}
class C2 {}

class C extends C1, C2 { }


void main() {}
