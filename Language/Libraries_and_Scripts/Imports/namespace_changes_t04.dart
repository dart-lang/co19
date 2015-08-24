/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The current library is the library currently being compiled.
 * The import modifies the import namespace of the current library in a manner that is
 * determined by the imported library and by the optional arguments provided in the import.
 * 
 * Let I be an import directive that refers to a URI via the string s1. Evaluation
 * of I proceeds as follows:
 * First,
 *   - If the URI that is the value of s1 has not yet been accessed by an import
 *     or export directive in the current isolate then the contents of the URI are
 *     compiled to yield a library B. Because libraries may have mutually recursive
 *     imports, care must be taken to avoid an infinite regress.
 *   - Otherwise, the contents of the URI denoted by s1 have been compiled into
 *     a library B within the current isolate.
 *     
 * Let NS0 be the exported namespace of B. Then, for each combinator clause Ci, 1 <= i <= n in I:
 *   - If Ci is of the form show id1, ..., idk then let NSi = show([id1, ..., idk], NSi-1) where 
 *     show(l, n) takes a list of identifiers l and a namespace n, and produces a namespace 
 *     that maps each name in l to the same element that n does. Furthermore, for each name x in l,
 *     if n defines the name x = then the new namespace maps x = to the same element that n does.
 *     Otherwise the resulting mapping is undefined.
 *   - If Ci is of the form hide id1, ..., idk then let NSi = hide([id1, ..., idk], NSi-1) where
 *     hide(l, n) takes a list of identfiers l and a namespace n, and produces a namespace 
 *     that is identical to n except that for each name k in l, k and k= are undefined.
 * 
 * Next, if I includes a prefix clause of the form as p, let NS = prefix(p, NSn)
 * where prefix(id, n), takes an identifier id and produces a namespace that has, for each 
 * entry mapping key k to declaration d in n, an entry mapping id.k to d. 
 * Otherwise, let NS = NSn. It is a compile-time error if the current library
 * declares a top-level member named p.
 * 
 * Then, for each entry mapping key k to declaration d in NS, d is made available in the top level 
 * scope of L under the name k unless either:
 *   - a top-level declaration with the name k exists in L, OR
 *   - a prefix clause of the form as k is used in L.
 *   
 * @description Checks that names imported into library B (which, in turn, is imported 
 * into library A) are not visible in A if B does not explicitly re-export A, 
 * with or without the prefix used to import A into B.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

import "namespace_changes_lib.dart";

main() {
  try {
    var x = P.bFoo; /// static type warning cannot resolve
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(e) {}
}
