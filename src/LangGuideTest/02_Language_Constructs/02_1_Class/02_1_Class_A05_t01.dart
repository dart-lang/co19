/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A class cannot be specified as part of the implements list.
 * @description Checks that class can not be 'implemented'.
 * @author iefremov
 * @compile-error 
 * @reviewer msyabro
 */

class A {}
class B implements A {}


main() {}
