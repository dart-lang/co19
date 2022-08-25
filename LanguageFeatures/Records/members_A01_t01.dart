// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A record type declares all of the members defined on [Object]. It
/// also exposes getters for each named field where the name of the getter is
/// the field's name and the getter's type is the field's type.
///
/// @description Checks that a record type declares all of the members defined
/// on Object
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

main() {
  Expect.isTrue((42, "Answer").runtimeType is Type);
  Expect.isTrue((null, name: "Null").hashCode > 0);
  Expect.isTrue((3, 1, 4, "Pi").toString() is String);
  Expect.isTrue((2.71, "e").noSuchMethod is Function);
}
