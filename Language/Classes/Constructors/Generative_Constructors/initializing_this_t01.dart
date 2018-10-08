/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Using an initializing formal this.id in a formal parameter list
 * does not introduce a formal parameter name into the scope of the constructor.
 * However, the initializing formal does effect the type of the constructor
 * function exactly as if a formal parameter named id of the same type were
 * introduced in the same position.
 * @description Checks that an initializing formal 'this.id' can be named and
 * is accessible by the name 'id'.
 * @author msyabro
 */
import "../../../../Utils/expect.dart";

class C {
  int id;
  C({this.id:1}) {}
}

main() {
  var o = new C();
  Expect.equals(1, o.id);

  o = new C(id: 3);
  Expect.equals(3, o.id);
}

