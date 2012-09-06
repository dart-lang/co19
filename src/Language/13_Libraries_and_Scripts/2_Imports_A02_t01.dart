/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Every library L has an import namespace I that maps names to declarations
 * given in other libraries. Any name N defined by I is in scope in L, unless either:
 * - a declaration with the name N exists in L. OR
 * - L contains an import of the form import ... as N.
 * 
 * The current library is the library currently being compiled. The import modifies 
 * the import namespace of the current library in a manner that is determined
 * by the imported library and by the optional arguments provided in the import.
 * 
 * Let I be an import directive that refers to a URI via the string s1. Evaluation
 * of I proceeds as follows:
 * First,
 *   - If the contents of the URI that is the value of s1 have not yet been compiled
 *     in the current isolate then they are compiled to yield a library B. Because
 *     libraries may have mutually recursive imports, care must be taken to avoid an
 *     infinite regress.
 *   - Otherwise, the contents of the URI denoted by s1 have been compiled into
 *     a library B within the current isolate.
 *     
 * Let NS0 = ExportedB where ExportedB is the exported namespace of B. Then, for each 
 * combinator clause Ci, 1 <= i <= n in I:
 *   - If Ci is of the form show id1, ..., idk then let NSi = show([id1, ..., idk], NSi-1) where 
 *     show(l, n) takes a list of identifiers l and a namespace n, and produces a namespace 
 *     that maps each name in l to the same element that n does, and is undefined otherwise.
 *   - If Ci is of the form hide id1, ..., idk then let NSi = hide([id1, ..., idk], NSi-1) where
 *     hide(l, n) takes a list of identfiers l and a namespace n, and produces a namespace 
 *     that is identical to n except that it is undefined for each name in l.
 * 
 * Let ImportNamespace = NSn. If I includes an export clause, then for each
 * entry mapping key k to declaration d in ImportNamespace an entry mapping
 * k to d is added to the exported namespace of L unless a top-level declaration
 * with the name k exists in L. We say that L re-exports library B, and also that
 * L re-exports namespace ImportNamespace. When no confusion can arise, we
 * may simply state that L re-exports B, or that L re-exports ImportNamespace.
 * 
 * Next, if I includes a prefix clause of the form as p, let NS = prefix(p, ImportNamespace)
 * where prefix(id, n), takes an identifier id and produces a namespace that has, for each 
 * entry mapping key k to declaration d in n, an entry mapping id.k to d. 
 * Otherwise, let NS = ImportNamespace.
 * 
 * Then, for each entry mapping key k to declaration d in NS, d is made available in the top level 
 * scope of L under the name k unless either:
 *   - a declaration with the name k exists in L, OR
 *   - a prefix clause of the form as k is used in L.
 *   
 * We say that the namespace NS has been imported into L. 
 * 
 * @description Checks that if the specified prefix is an empty string,
 * and no show/hide combinators are used, each non-private top level declaration 
 * d of B is added to the scope of A.
 * @author vasya
 * @reviewer msyabro
 * @reviewer rodionov
 */

import "2_Imports_A02_lib.dart";

main() {
  Expect.equals("A_FOO", aFoo);
  Expect.equals('aFunc', aFunc());
  aTypeAlias ff = (bool b, String s) {};

  A a = new A();
  J j = new J();

  Expect.equals('A.FOO', A.FOO);
  Expect.equals("2_Imports_A02_lib.bar", a.bar);
  Expect.equals('J.FOO', J.FOO);
}
