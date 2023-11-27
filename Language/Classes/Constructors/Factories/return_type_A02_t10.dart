// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The return type of a factory whose signature is of the form
/// factory M or the form factory M.id is M if M is not a generic type;
/// otherwise the return type is M<T1, . . . , Tn> where T1, . . . , Tn are the
/// type parameters of the enclosing class.
///
/// @description Checks that returning an instance of a subtype of `M`
/// from a factory constructor `M` does not produce an error. Test type alias
/// @author sgrekhov@unipro.ru

abstract class A {
  A() {}
  factory A.foo() => CAlias.foo();
}

class C extends A {
  C.foo() {}
}
typedef CAlias = C;

main() {
  A.foo();
}
