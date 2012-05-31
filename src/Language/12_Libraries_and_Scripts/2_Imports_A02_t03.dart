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
 * Imports assume a global namespace of libraries (at least per isolate). They also
 * assume the library is in control, rather than the other way around.
 * 
 * Compiling an import directive of the form #import(s1, c: a); proceeds as follows:
 * - If the contents of the URI that is value of s1 have not yet been compiled
 * in the current isolate then they are compiled to yield a library B. 
 * It is compile-time error if s1 does not denote a URI that contains the source
 * code for a Dart library.
 * - Otherwise, the contents of the URI denoted by s1 have been compiled into
 * a library B within the current library.
 * 
 * Then, let NS be the the mapping of names to declarations defined by
 * c(a, NS1) where NS1 is the public namespace of B, and c is one of the following 
 * namespace combinators:
 * - prefix(s, n) takes a string s and a namespace n
 *   - If s is the empty string, the result is n.
 *   - Otherwise, the result is a namespace that has, for each entry mapping
 *   key k to declaration d in n, an entry mapping s.k to d.
 * - show(l, n) takes a list of strings l and a namespace n, and produces a
 * namespace that maps each string k in l to the same element that n does,
 * and is undefined otherwise.
 * 
 * Then, a mapping from each name in NS to the corresponding value in NS
 * is added to the import namespace of the current library.
 * @description Checks that names imported into library B (which, in turn, is imported into library A)
 * are not added to the scope of library A since they are not a part of the public namespace of B. Empty prefix.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

#import("2_Imports_A02_lib.dart");

main() {
  try {
    cFoo === 'C_FOO';
  } catch(var e) {}
}
