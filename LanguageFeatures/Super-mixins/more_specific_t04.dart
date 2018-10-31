/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If more than one super-constraint interface declares a member
 * with  the same name, at least one of those members is more specific than the
 * rest,  and this is the unique signature that super-invocations are allowed
 * to invoke.
 *
 * @description Checks that if more than one super-constraint interface declares
 * a member with the same name, at least one of those members is more specific
 * than the rest, and this is the unique signature that super-invocations are
 * allowed to invoke. Test type parameters
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";


class I {}
class J {}

abstract class B<T1> {
  T1 get b1;
}
abstract class C<T1> {
  T1 get b1;
}

mixin M<X> on B<X>, C<X> implements I, J {
  test() {
    Expect.equals("A", super.b1);
  }
}

class A implements B<String>, C<String> {
  String get b1 => "A";
}

class MA extends A with M<String> {
}

main() {
  MA ma = new MA();
  ma.test();
}
