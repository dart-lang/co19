// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Regression test for the issue 33701 (Dart does not throw error
/// if function argument parameter extends [Null]).
///
/// Finally analyzer behavior was fixed here, so checks that typedef type
/// parameter can extend [Never] with nnbd turned on.
///
/// @Issue 33701
/// @author iarkh@unipro.ru


typedef F1<X extends Never> = X Function();
typedef F2<X extends Never> = void Function(X);
typedef F3<X extends Never> = X Function(X);
typedef F4<X extends Never> = void Function();
typedef F5<X extends Never> = void Function<X1 extends X>();
typedef F6<X extends Never> = X Function<X1 extends X>(X);
typedef F7<X extends Never> = void Function<X1 extends X>(X);
typedef F8<X extends Never> = void Function<X1 extends Null>(X);

main() {}
