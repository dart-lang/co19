/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A generic type is a type which is introduced by a generic class
 * declaration or a generic type alias, or it is the type [FutureOr].
 * @description Checks that exception is thrown when try to use non-generic type
 * with typed parameter
 * @author iarkh@unipro.ru
 */

class A {}
void testme() {}

typedef AAlias = A;
typedef int TestFunction();
typedef Func1 = void Function(int);

main() {
}
