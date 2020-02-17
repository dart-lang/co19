/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if a top level variable, static variable, or
 * instance field with potentially non-nullable type has no initializer
 * expression and is not initialized in a constructor via an initializing formal
 * or an initializer list entry, unless the variable or field is marked with the
 * 'late' modifier.
 *
 * @description Check that it is no compile-time error if an instance field
 * with potentially non-nullable type has no initializer expression but
 * initialized in a constructor via an initializing formal or an initializer
 * list entry. Test FutureOr
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "dart:async";
import "legacy_lib.dart";

typedef void Foo();
class A {}
void foo() {}
dynamic getX() => null;

class C1<T extends Object> {
  FutureOr<T> t1;
  FutureOr<Function> f1;
  FutureOr<Foo> f2;
  FutureOr<A> a1;
  FutureOr<M> m1;
  FutureOr<FutureOr<A>> a2;

  C1(FutureOr<T> t, FutureOr<Function> f1, FutureOr<Foo> f2, FutureOr<A> a1, FutureOr<M> m1, FutureOr<FutureOr<A>> a2)
      : this.t1 = t, this.f1 = f1, this.f2 = f2, this.a1 = a1, this.m1 = m1, this.a2 = a2 {}
}

class C2<T extends Object> {
  FutureOr<T> t1;
  FutureOr<Function> f1;
  FutureOr<Foo> f2;
  FutureOr<A> a1;
  FutureOr<M> m1;
  FutureOr<FutureOr<A>> a2;
  C2(this.t1, this.f1, this.f2, this.a1, this.m1, this.a2);
}

class C3 {
  FutureOr<Never> n1;

  C3(FutureOr<Never> n) : n1 = n {}
}

class C4 {
  FutureOr<Never> n1;

  C4(this.n1);
}


main() {
  new C1<String>("s", foo, foo, A(), M(), A());
  new C2<String>("s", foo, foo, A(), M(), A());
  var x = getX();
  if (x is Never) {
    new C3(x);
    new C4(x);
  }
}
