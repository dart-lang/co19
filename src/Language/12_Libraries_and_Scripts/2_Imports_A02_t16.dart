/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Every library L has an import namespace I that maps names to declarations
 * given in other libraries. Any name N defined by I is in scope in L, unless either:
 * - a declaration with the name N exists in L. OR
 * - a prefix combinator with initial argument N is used in L.
 * 
 * The current library is the library currently being compiled. The import modifies 
 * the import namespace of the current library in a manner that is determined
 * by the imported library and by the optional arguments provided in the import.
 * 
 * Compiling an import directive of the form #import(s1, export: b, 
 * c1: a1 ... cn: an, prefix: s); proceeds as follows:
 *   - If the contents of the URI that is the value of s1 have not yet been compiled
 *     in the current isolate then they are compiled to yield a library B.
 *   - Otherwise, the contents of the URI denoted by s1 have been compiled into
 *     a library B within the current isolate.
 * 
 * Then, let ImportNamespace be the the mapping of names to declarations
 * defined by cn(...(c1(ExportedB, a1) where ExportedB is the exported namespace
 * of B, and ci,  1 <= i <= n is one of the following namespace combinators:
 *   - show(l, n) takes a list of strings l and a namespace n, and produces a
 *     namespace that maps each string k in l to the same element that n does,
 *     and is undefined otherwise.
 *   - hide(l, n) takes a list of strings l and a namespace n, and produces a
 *     namespace that is identical to n except that it is undefined for each string
 *     k in l.
 * If b is true, then for each entry mapping key k to declaration d in ImportNamespace
 * an entry mapping k to d is added to the exported namespace of L unless a top-level 
 * declaration with the name k exists in L. We say that L re-exports library B, 
 * and also that L re-exports namespace ImportNamespace. When no confusion can arise, 
 * we may simply state that L re-exports B, or that L re-exports ImportNamespace.
 * 
 * The prefix combinator, prefix(s, n), takes a string s and a namespace n.
 * If s is the empty string, the result is n. Otherwise, the result is a namespace
 * that has, for each entry mapping key k to declaration d in n, an entry mapping
 * s.k to d.
 * 
 * Then, for each entry mapping key k to declaration d in prefix(s, ImportNamespace),
 * d is made available in the top level scope of L unless either:
 *   - a declaration with the name k exists in L, OR
 *   - a prefix combinator with initial argument k is used in L.
 *   
 * We say that the namespace prefix(s, ImportNamespace) has been imported
 * into L. An import directive that has no export: argument specified is assumed
 * to have the argument export: false. An import directive that has no prefix:
 * argument is assumed to have the argument prefix: "".
 * @description Checks that all names reexported by the imported library are also added
 * to the import namespace of the current library and that the prefix specified in
 * the import directive affects only the import namespace of the library it's used in,
 * but not the export namespace of that library (no show/hide combinators are used).
 * @author rodionov
 */

#import("2_Imports_A02_lib_reexport.dart");

main() {
  Expect.equals("A_FOO", aFoo);
  Expect.equals('aFunc', aFunc());
  aTypeAlias ff = (bool b, String s) {};

  A a = new A();
  J j = new J();

  Expect.equals('A.FOO', A.FOO);
  Expect.equals("2_Imports_A02_lib.bar", a.bar);
  Expect.equals('J.FOO', J.FOO);
  
  // from 2_Imports_A02_p1_lib.dart
  Expect.listEquals([1], bList(1));
  bFunc bf = null;
  Expect.equals("B_FOO", bFoo);
  Expect.equals("2_Imports_A02_p1_lib.foo()", new B.spec().foo());
  Expect.equals("i.foo()", new I().foo());
}
