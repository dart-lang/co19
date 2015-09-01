/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 *  metadata:
    (‘@’ qualiﬁed (‘.’ identiﬁer)? (arguments)?)*
    ;
    @description Verify several kinds of valid metadata declarations
    @author a.semenov@unipro.ru
 */

import "syntax_lib1.dart";
import "syntax_lib2.dart" as syntax_lib2;

@A()
class Test1{}

@B() @B.b(10)
class Test2{}

@Foo(1,2)
class Test3{}

@syntax_lib2.C()
class Test4{}

@syntax_lib2.D() @syntax_lib2.D.d(10)
class Test5{}

@syntax_lib2.Bar(1,2)
class Test6{}

main() {

}