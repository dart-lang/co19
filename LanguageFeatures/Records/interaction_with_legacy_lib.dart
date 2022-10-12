// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  It is not an error for a library whose language version is less
/// than v (a "legacy library") to include types which denote or include the
/// [Record] class, record types or record expressions when these terms arise
/// directly or indirectly from references to another library whose language
/// version is greater than or equal to v. For example, such a legacy library
/// may reference a typedef name which is bound to a record type in another
/// library, and the semantic interpretation of the typedef is as the underlying
/// record type, just as it would be for any other type. Similarly, type
/// inference may introduce record types into a legacy library, and such types
/// will be interpreted by the compiler as record types as usual (that is, there
/// is no erasure implied to remove these inferred types). A legacy library may
/// refer to the [Record] class via a library which has re-exported it. Record
/// values may flow into a legacy library via a reference to a member from
/// another library, and a legacy library may freely call getters on record
/// values (since there is no new syntax for calling a record getter). The
/// rationale for the choices described in this section is that the intent of
/// language versioning (for an additive feature such as records) is to ensure
/// that users do not accidentally use new features in a package without
/// specifying an SDK constraint which ensures that their code will always be
/// run on an SDK which supports the feature. But in the case of a legacy
/// library which references record values or types indirectly via another
/// library, the SDK constraint on the referenced library is sufficient to
/// enforce this.
///
/// @description Non-legacy library for interaction with legacy ones
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

library interaction_with_legacy_lib;
export "dart:core" show Record;

typedef R0 = ();
typedef R1 = (int,);
typedef R2 = (int, String);
typedef R3 = (num, {String name});
typedef R4 = ({String s});
typedef Rec = Record;

var r0 = ();
var r1 = (42,);
var r2 = (1, "one");
var r3 = (3.14, name: "pi");
var r4 = (s: "Lily was here");
var rec = (1, 2, 3, one: "1", two: "2", three: "3");
