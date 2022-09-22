// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a field name starts with an underscore, it is private and is
/// only accessible in the library where it appears. The records `(_foo: 1)` and
/// `(_foo: 1)` appearing in different libraries do not have the same shape
/// because each `_foo` is considered a distinct name. Likewise, the record
/// types `({int _foo})` and `({int _foo})` are not the same type if those
/// annotations appear in different libraries.
///
/// @description Checks that if a field name starts with an underscore then it
/// is not accessible in a different library
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

library static_semantics_A05_lib;

typedef T1 (num _, {String _name});
typedef T2 (num, {String _name});

(num, {String _s}) foo() => (3.14, _s: "pi");

void bar((num, {String _s}) r) {}

T1 r1 = (42, _name: "Answer");
T2 r2 = (3.14, _name: "pi");

({num _x, num _}) r3 = (_x: 1.1, _: 2.2);

var r4 = (_foo: 1);
