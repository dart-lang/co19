/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A non-factory constructor doesn't have any return type (even in typed mode). 
 * @description Checks return type corresponding to the class for named constructor.
 * @author iefremov 
 * @compile-error
 * @reviewer msyabro
 */ 

class C {
  C C.makeC() { return this;}
}

void main() {
  var c =  new C.makeC();
}
