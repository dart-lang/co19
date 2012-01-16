/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if any default values are specified in the signature
 * of an interface method, getter, setter or constructor.
 * @description Checks that it is a compile-time error if any default values are specified 
 * in the signature of an interface constructor.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

class F  {
  factory I([bool b = true]) { }
}

interface I default F {
  I([bool b=true]);
}

main() {
 try {
   I i1=new I();
   assert(i1!=null);
 } catch(var x) {
 }
}