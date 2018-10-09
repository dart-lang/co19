/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Regression test for the Issue 33786 (Dartanalyzer does not
 * report error about illegal recursive type in class declaration). Checks that
 * [class A<X extends A<X>> extends M<A<A<A<A<X>>>>>] can be declared in runtime
 * @Issue #33786
 * @author iarkh@unipro.ru
 */
class M<X> {}
class A<X extends A<X>> extends M<A<A<A<A<X>>>>> {}

main() {}
