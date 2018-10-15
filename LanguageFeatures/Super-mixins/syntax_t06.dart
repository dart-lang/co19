/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A mixin declaration syntax separate from class declarations:
 * mixinDeclaration :
 *   metadata? 'mixin' identifier typeParameters? ('on' types)?
 *     ('implements' types)? '{' mixinMember* '}'
 *
 * @description Checks that mixin declaration above is correct. Metadata usage
 * is checked
 * @author ngl@unipro.ru
 */

class I {}
class J {}

class B {}
class C {}

const IM = 1;

class AM {
  const AM();
}
class BM<X> {
  const BM();
  const BM.b(X x);
  const BM.c(int i, X x);
}
enum EM {a, b, c}
const _bc = const BM<double>.c(1, 2.3);
const _bb = const BM<String>.b('abc');
const _ba = const BM<AM>.b(const AM());

@IM @AM() @_bc @EM.a
mixin M1 on B, C implements I, J {}

@BM() @EM.b
mixin M2 on B, C implements I, J {}

@_bb @EM.c
mixin M3 on B, C implements I, J {}

@_ba
mixin M4 on B, C implements I, J {}

main() {
}
