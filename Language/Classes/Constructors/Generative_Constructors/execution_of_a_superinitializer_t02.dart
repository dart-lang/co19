/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a superinitializer of the form
 *   super(a1, ..., an; xn+1: an+1,...,xn+k: an+k)
 *   (respectively super.id(a1, ..., an; xn+1: an+1,...,xn+k: an+k)
 * proceeds as follows:
 * First, the argument list (a1, ..., an; xn+1: an+1,...,xn+k: an+k) is
 * evaluated.
 * Let C be the class in which the superinitializer appears and let S be the
 * superclass of C. If S is generic, let U1,...,Um be the actual type
 * parameters passed to S in the superclass clause of C.
 * Then, the initializer list of the constructor S (respectively S.id) is
 * executed with respect to the bindings that resulted from the evaluation of
 * the argument list, with this bound to the current binding of this, and the
 * type parameters (if any) of class S bound to the current bindings of
 * U1,...,Um.
 * @description Checks that the execution order as well as type parameters
 * binding for both named and unnamed superinitializers are correct. Test type
 * aliases
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
import "../../../../Utils/expect.dart";

var log;
f(var entry) {
  log.add(entry.toString());
  return f;
}

class S<T, U> {
  S(var x, var y, [var o]) : this.s1 = x("s1${1 is T}"),
      this.s2 = y("s2${1.0 is U}"), this.s3 = x(1 is U),
      this.s4 = x(1.0 is T) {

    s1("ok");
  }
  S.named(var x, var y, {var o}) : this.s1 = x("s1${1 is T}"),
      this.s2 = y("s2${1.0 is U}"),  this.s3 = x(1 is U),
      this.s4 = x(1.0 is T) {

    s1("named!");
  }

  var s1;
  var s2;
  var s3, s4;
}

typedef SAlias = S<int, double>;

class C extends SAlias {
  C() : super(f("a1"), f("a2"), f("o"));
  C.named() : super.named(f("a1"), f("a2"), o : f("o"));
}

main() {
  log = [];
  new C();
  Expect.listEquals(["a1","a2", "o", "s1true", "s2true", "false", "false",
    "ok"], log, "Wrong superinitializer evaluation order!");

  log = [];
  new C.named();
  Expect.listEquals(["a1","a2", "o", "s1true", "s2true", "false", "false",
    "named!"], log, "Wrong superinitializer evaluation order!");

}
