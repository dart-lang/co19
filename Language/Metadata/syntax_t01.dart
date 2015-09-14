/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 *  metadata:
 *   (‘@’ qualified (‘.’ identifier)? (arguments)?)*
 *   ;
 * @description Verify several kinds of valid metadata declarations.
 * Metadata refers to local constants and classes.
 * @author a.semenov@unipro.ru
 */

const Z = 'Zombie';

class A {
    const A();
}

class B<T> {
    const B();
    const B.b(T t);
}

class Foo {
    const Foo(int x, int y);
}

enum E {a, b, c}

@A()
class Test1{}

@A() @B() @B.b(10) @E.c
class Test2{}

@Foo(1,2)
class Test3{}

@B() @Z @E.b
class Test4{}

@B.b('aaa')
class Test5{}

main() {
}
