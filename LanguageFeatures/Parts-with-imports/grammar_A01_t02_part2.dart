// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It’s a compile-time error if a Dart (parent) file with URI P has
/// a `part` directive with a URI U, and the source content for the URI U does
/// not parse as a `<partDirective>`, or if its leading `<partHeader>`'s `<uri>`
/// string, resolved as a URI reference against the URI U, does not denote the
/// library of P. That is, if a Dart file has a part directive, its target must
/// be a part file whose “part of” directive points back to the first Dart file.
/// Nothing new, except that now the parent file may not be a library file.)
///
/// @description Check that it is a compile-time error if a parent file which is
/// not a library file points to a part file without `part of` directive.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enhanced-parts

foo() {}
