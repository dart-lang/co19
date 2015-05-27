/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable declaration of one of the forms
 * var v;, var v = e; , const v = e;, final v; or final v = e;
 * always induces an implicit getter function with signature
 *   get v
 * @description For all types of forms checks that return type of getter is
 * dynamic by expecting no static warnings.
 * @static-clean
 * @author ilya
 */
import "../../Utils/expect.dart";

//--library static variables
var x1;
var x2 = null;
const x3 = null;
//final x4; //can not be
final x5 = null;

class C {
  //--instance variables
  var y1;
  var y2 = null;
  //const y3 = null; //can not be
  final y4;
  final y5 = null;
  
  //--class static variables
  static var z1;
  static var z2 = null;
  static const z3 = null;
  //static final z4; //can not be
  static final z5 = null;

  C() : y4 = null;
}

main() {
  Expect.throws(() => x1.nonexistent());
  Expect.throws(() => x2.nonexistent());
  Expect.throws(() => x3.nonexistent());
  Expect.throws(() => x5.nonexistent());

  C c = new C();
  
  Expect.throws(() => c.y1.nonexistent());
  Expect.throws(() => c.y2.nonexistent());
  Expect.throws(() => c.y4.nonexistent());
  Expect.throws(() => c.y5.nonexistent());
  
  Expect.throws(() => C.z1.nonexistent());
  Expect.throws(() => C.z2.nonexistent());
  Expect.throws(() => C.z3.nonexistent());
  Expect.throws(() => C.z5.nonexistent());
}
