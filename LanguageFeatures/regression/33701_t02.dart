// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Regression test for the issue 33701 (Dart does not throw error
/// if function argument parameter extends [Null]). Checks that [typedef] type
/// parameter cannot extend [Null]
///
/// Finally, analyzer behavior was updated, so checks that function type
/// parameter can extends [Null] with nnbd turned on.
///
/// @Issue 33701
/// @author iarkh@unipro.ru


typedef F1<X extends Null> = X Function();
typedef F2<X extends Null> = void Function(X);
typedef F3<X extends Null> = X Function(X);
typedef F4<X extends Null> = void Function();
typedef F5<X extends Null> = void Function<X1 extends X>();
typedef F6<X extends Null> = X Function<X1 extends X>(X);
typedef F7<X extends Null> = void Function<X1 extends X>(X);
typedef F8<X extends Null> = void Function<X1 extends Null>(X);

main() {
  print(F7);
}
