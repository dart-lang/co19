/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 *  metadata:
 *   (‘@’ qualiﬁed (‘.’ identiﬁer)? (arguments)?)*
 *   ;
 * @description Verify several kinds of valid metadata declarations.
 * Metadata refers to constants and classes imported from library without prefix.
 * @author a.semenov@unipro.ru
 */

import "syntax_lib1.dart";


@A()
class Test1{}

@A() @B() @B.b(10) @E.c
class Test2{}

@Foo(1,2)
class Test3{}

@B() @X @E.b
class Test4{}

@B.b('aaa')
class Test5{}

main() {
}
