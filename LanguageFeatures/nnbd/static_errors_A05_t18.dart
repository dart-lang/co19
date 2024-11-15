// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error if a class declaration declares an instance
/// variable with a potentially non-nullable type and no initializer expression,
/// and the class has a generative constructor where the variable is not
/// initialized via an initializing formal or an initializer list entry, unless
/// the variable is marked with a `late`, `abstract`, or `external` modifier.
///
/// @description Check that it is no error if an instance variable with a
/// potentially non-nullable type has no initializer expression but initialized
/// in a constructor via an initializing formal or an initializer list entry.
/// Test type `FutureOr`.
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-strong

import "dart:async";

typedef void Foo();

class A {}

void foo() {}
dynamic getX() => null;

class C1<T extends Object> {
  FutureOr<T> t1;
  FutureOr<Function> f1;
  FutureOr<Foo> f2;
  FutureOr<A> a1;
  FutureOr<FutureOr<A>> a2;
  C1(
    FutureOr<T> t,
    FutureOr<Function> f1,
    FutureOr<Foo> f2,
    FutureOr<A> a1,
    FutureOr<FutureOr<A>> a2,
  ) : this.t1 = t,
      this.f1 = f1,
      this.f2 = f2,
      this.a1 = a1,
      this.a2 = a2 {}
}

class C2<T extends Object> {
  FutureOr<T> t1;
  FutureOr<Function> f1;
  FutureOr<Foo> f2;
  FutureOr<A> a1;
  FutureOr<FutureOr<A>> a2;
  C2(this.t1, this.f1, this.f2, this.a1, this.a2);
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
  C1<String>("s", foo, foo, A(), A());
  C2<String>("s", foo, foo, A(), A());
  var x = getX();
  if (x is Never) {
    new C3(x);
    new C4(x);
  }
}
