/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a formal parameter bound [B]
 * contains a type [T] on the form qualified and [T] denotes a generic class [G]
 * (that is, [T] is a raw type), unless every formal type parameter of [G] has a
 * simple bound.
 * In short, type arguments on bounds can only be omitted if they themselves
 * have simple bounds. In particular, class [C<X extends C> {}] is a
 * compile-time error because the bound [C] is raw, and the formal type
 * parameter [X] that corresponds to the omitted type argument does not have a
 * simple bound.
 * @description Checks that declaration of the function variable with
 * simple-bounded type argument does not cause compile error
 * @author iarkh@unipro.ru
 */

typedef F<X> = X Function();
typedef Y<X> = F<F<X>> Function(F<F<X>>);

F<F<int>> function (F<F<int>> ttt) { return ttt; }

Y<int> check = function;

main() {}
