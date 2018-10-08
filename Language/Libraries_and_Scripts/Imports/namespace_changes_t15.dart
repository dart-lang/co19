/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The current library is the library currently being compiled. The
 * import modifies the import namespace of the current library in a manner that
 * is determined by the imported library and by the optional elements of the
 * import.
 * . . .
 * Let I be an import directive that refers to a URI via the string s1.
 * Evaluation of I proceeds as follows:
 * . . .
 * If I is an immediate import then, first
 * • If the URI that is the value of s1 has not yet been accessed by an import
 *   or export directive in the current isolate then the contents of the URI
 *   are compiled to yield a library B. Because libraries may have mutually
 *   recursive imports, care must be taken to avoid an infinite regress.
 * • Otherwise, the contents of the URI denoted by s1 have been compiled into
 *   a library B within the current isolate.
 *
 * Let NS0 be the exported namespace of B. Then, for each combinator clause Ci,
 * 1 <= i <= n in I:
 * • If Ci is of the form
 *   show id1, ..., idk
 *   then let NSi = show([id1, ..., idk], NSi-1)
 *   where show(l, n) takes a list of identifiers l and a namespace n, and
 *   produces a namespace that maps each name in l to the same element that n
 *   does. Furthermore, for each name x in l, if n defines the name x= then
 *   the new namespace maps x= to the same element that n does. Otherwise the
 *   resulting mapping is undefined.
 * • If Ci is of the form
 *   hide id1, ..., idk
 *   then let NSi = hide([id1, ..., idk], NSi-1)
 *   where hide(l, n) takes a list of identfiers l and a namespace n, and
 *   produces a namespace that is identical to n except that for each name k
 *   in l, k and k= are undefined.
 *
 * Next, if I includes a prefix clause of the form as p, let NS = NSn ∪
 * {p : pref ixObject(NSn)} where pref ixObject(NSn) is a prefix object for the
 * namespace NSn , which is an object that has the following members:
 * • For every top level function f named id in NSn, a corresponding method with
 *   the same name and signature as f that forwards to f.
 * • For every top level getter with the same name and signature as g named id
 *   in NSn, a corresponding getter that forwards to g.
 * • For every top level setter s with the same name and signature as named id
 *   in NSn, a corresponding setter that forwards to s.
 * • For every type T named id in NSn, a corresponding getter named id with
 *   return type Type, that, when invoked, returns the type object for T.
 * Otherwise, let NS = NSn. It is a compile-time error if the current
 * library declares a top-level member named p.
 * . . .
 * Then, for each entry mapping key k to declaration d in NS, d is made
 * available in the top level scope of L under the name k unless either:
 * • a top-level declaration with the name k exists in L, OR
 * • a prefix clause of the form as k is used in L.
 *
 * @description Checks that all specified show and hide combinators are applied
 * and if a name is hidden by any of them, it's undefined in the resulting
 * namespace.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */
import "namespace_changes_lib.dart" show aFoo, aFunc hide aFunc;

main() {
  aFunc();
}
