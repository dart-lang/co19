/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A generic type alias is a declaration [D] of one of the following
 * forms:
 *    m typedef id<X1extendsB1, ..., Xs extendsBs> = T;
 * ...
 * where [m] is derived from metadata, [T] is a type, and [S?] is a type or the
 * empty string.
 * @description Checks that constant generic class constructor can be used as
 * metadata, but generic metadata type argument cannot be used in metadata.
 * @author iarkh@unipro.ru
 */

class C<T> { const C(); }

@C() typedef G = void Function();
@C<int>() typedef K = void Function();  //# 01: compile-time error

main() {}
