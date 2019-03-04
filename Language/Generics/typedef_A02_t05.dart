/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A generic type alias is a declaration [D] of one of the following
 * forms:
 * ...
 *   m typedef S? id<X1extendsB1, ..., Xs extendsBs>(
 *     T1 p1, ..., Tn pn, [Tn+1 pn+1, ..., Tn+k pn+k]);
 *   m typedef S? id<X1extendsB1, ..., Xs extendsBs>(
 *     T1 p1, ..., Tn pn, {Tn+1 pn+1, ..., Tn+k pn+k});
 * where [m] is derived from metadata, [T] is a type, and [S?] is a type or the
 * empty string.
 * @description Checks that [T] can be another function type alias.
 * @author iarkh@unipro.ru
 */

typedef Alias1<T> = T Function(T);
typedef Alias2<T> = Alias1<T>;

main() {}
