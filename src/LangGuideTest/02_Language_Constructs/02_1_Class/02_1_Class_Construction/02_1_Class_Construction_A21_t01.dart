/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a load error to have cyclic constructor redirections.
 * @description Checks cyclic redirection. 
 * @author iefremov
 * @compile-error
 * @reviewer msyabro
 */

class A {
  A() : this();
}



void main() {
   
}
