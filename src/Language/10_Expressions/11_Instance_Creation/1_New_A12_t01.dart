/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If q is a redirecting factory constructor of the form
 * T(p1, ..., pn+k ) = c; or of the form T.id(p1, ..., pn+k ) = c;
 * then the result of the evaluation of e is equivalent to evaluating the expression
 * [V1, ..., Vm /T1, ..., Tm ](new c(a1, ..., an, xn+1:an+1, ..., xn+k: an+k )).
 * @description Checks that evaluation of redirecting constructor is equivalent of 
 * evaluation of redirected constructor.
 * @author kaigorodov
 */

class R<T> {
  factory fc(T arg)=C;
}

class C<T> implements R<T> {
   T value;
   
   C(this.value) {}
   
   bool operator ==(other)  {
     if (identical(other, null) {
       return false;
     }
     if (identical(value, null) {
       return identical(other.value, null);
     }
     return value==other.value;
   }
   
   int hashCode() { return value.hashCode(); }
}

main() {
  R<String> r1=new R<String>.fc();
  R<String> r2=new C<String>.fc();
  Expect.equals(r1, r2);
}
