/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Created object (this) is accessible from the body of the constructor.
 * @description Checks that this is accessible from the body of the constructor.
 * @author iefremov
 * @reviewer msyabro 
 */ 

class C {
  C() {this.v = this;}
  var v;
}


main() {
  var c = new C();
  Expect.isTrue(c == c.v);
}
