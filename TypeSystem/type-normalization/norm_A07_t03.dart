// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// NORM(R Function<X extends B>(S)) = R1 Function<X extends B1>(S1)
///  where R1 = NORM(R)
///  and B1 = NORM(B)
///  and S1 = NORM(S)
///
/// @description Checks that NORM(R Function<X extends B>(S)) =
/// R1 Function<X extends B1>(S1).
/// @author sgrekhov22@gmail.com

class A<X> {}
class B<X> implements A<X> {}

// ignore: unnecessary_question_mark
typedef F1<X extends Never> = Null? Function(dynamic? x);
typedef F2<X> = Null Function(dynamic x);

class C extends B<F1<Never>> implements A<F2<Never>> {}

main() {
  C();
}
