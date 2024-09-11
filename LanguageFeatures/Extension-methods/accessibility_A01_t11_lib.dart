// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension is accessible for an expression if it is declared in
/// the current library, or if there is a non-deferred `import` declaration in
/// the current library which imports a library with the extension in its export
/// scope, where the name of the extension is not private, and the declaration
/// is not hidden by a `hide` combinator mentioning the extension name, or a
/// `show` combinator not mentioning the name, on the import. This includes
/// (non-deferred) imports with a prefix.
///
/// @description Check that an extension is not accessible if a library where it
/// is declared is exported but it's name is hidden by a `show` combinator.
/// @author sgrekhov22@gmail.com

export 'accessibility_lib.dart' show StringExt;
