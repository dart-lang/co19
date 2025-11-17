// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion When type inference is flowing through a brace-delimited
/// collection literal, it is applied to each element. The existing type
/// inference behavior is mostly unchanged by this proposal. We add two new
/// clauses to handle null-aware elements:
///
/// To infer the type of `element` in context `P`:
/// ...
/// - If `element` is a `nullAwareMapElement` with entry `ek: ev`:
///   - If `P` is `_` then the inferred key and value types of element are:
///     - Let `Uk` be the inferred type of `ek` in context `_`.
///     - If `element` has a null-aware key then the inferred key element type
///       is `NonNull(Uk)`. The entry added to the map will never have a null
///       key.
///     - Else the inferred key element type is `Uk`. The whole element is
///       null-aware, but the key part is not, so it is inferred as normal.
///     - Let `Uv` be the inferred type of `ev` in context `_`.
///     - If element has a null-aware value then the inferred value element type
///       is `NonNull(Uv)`. The entry added to the map will never have a `null`
///       value.
///     - Else the inferred value element type is `Uv`. The whole element is
///       null-aware, but the value part is not, so it is inferred as normal.
///   - If `P` is `Map<Pk, Pv>` then the inferred key and value types of
///     `element` are:
///     - If `element` has a null-aware key then:
///       - Let `Uk` be the inferred type of `ek` in context `Pk?`. The key
///         expression has a nullable context type because it may safely
///         evaluate to `null` even when the surrounding map doesn't allow that
///         because the `?` will discard a null entry.
///       - The inferred key element type is `NonNull(Uk)`. The entry added to
///         the map will never have a null key.
///     - Else the inferred key element type is the inferred type of `ek` in
///       context `Pk`. The whole element is null-aware, but the key part is
///       not, so it is inferred as normal.
///     - If `element` has a null-aware value then:
///       - Let `Uv` be the inferred type of `ev` in context `Pv?`. The value
///         expression has a nullable context type because it may safely
///         evaluate to null even when the surrounding map doesn't allow that
///         because the `?` will discard a `null` entry.
///       - The inferred value element type is `NonNull(Uv)`. The entry added to
///         the map will never have a `null` value.
///     - Else the inferred value element type is the inferred type of `ev` in
///       context `Pv`. The whole element is null-aware, but the value part is
///       not, so it is inferred as normal.
///
/// @description Check that inferred value type of an element `ek: ?ev` in the
/// context `Map<Pk, Pv> is `Uk: NonNull(Uv)`, where `Uv` is the inferred type
/// of the expression `ev` the context `Pv?`.
/// @author sgrekhov22@gmail.com

import '../../../Utils/static_type_helper.dart';

main() {
  String? ev = "ev";

  <String, String?>{
    "ek": ?(contextType(ev)..expectStaticType<Exactly<String?>>())
  };
}
