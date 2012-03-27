/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A label is an identifier followed by a colon. A labeled statement is a statement
 * prefixed by a label L. A labeled case clause is a case clause within a switch
 * statement (11.8) prefixed by a label L.
 * The sole role of labels is to provide targets for the break (11.12) and continue
 * (11.13) statements.
 * label:
 * identifier ':'
 * ;
 * @description Checks that a statement can be marked with multiple labels (see the grammar in ch.11).
 * @author iefremov
 * @needsreview issue 2238
 */

main() {
  label1: label2: label3: var x;
  k: l: var x2;
  $: $$: $$$: var x3;
  a: b: c: d: e: f: g: h: i: j: k: l: m: n: o: p: q: r: s: t: u: v: w: x: y: z: var x4;
}
