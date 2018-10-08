/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If q is a redirecting factory constructor of the form
 * T(p1, ..., pn+k ) = c; or of the form T.id(p1, ..., pn+k ) = c; then the
 * result of the evaluation of e is equivalent to evaluating the expression
 * [V1, ..., Vm/T1, ..., Tm ](new c(a1, ..., an, xn+1: an+1, ..., xn+k: an+k)).
 * @description Checks that evaluation of redirecting factory constructor is
 * equivalent to evaluation of the constructor it's redirecting to.
 * @author kaigorodov
 * @reviewer rodionov
 */
import '../../../../Utils/expect.dart';

class R<T> {
  factory R.fc(T arg) = C<T>;
}

class C<T> implements R<T> {
   T value;

   C(this.value) {}

   int get hashCode {
     return value.hashCode;
   }

   bool operator ==(other) {
     if (identical(value, null)) {
       return identical(other.value, null);
     }
     return value == other.value;
   }
}

main() {
  String foo = "foo";
  R<String> r1 = new R<String>.fc(foo);
  R<String> r2 = new C<String>(foo);
  Expect.equals(r1, r2);
}
