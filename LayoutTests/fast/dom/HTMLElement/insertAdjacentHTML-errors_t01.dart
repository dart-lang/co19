/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test insertAdjacentHtml exceptions to make sure they match HTML5
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var div = document.createElement("div");

  shouldThrow(() {
    div.insertAdjacentHtml('beforeBegin', 'text');
  }, (e) => e is DomException && e.name == DomException.NO_MODIFICATION_ALLOWED);

  shouldThrow(() {
    div.insertAdjacentHtml('afterEnd', 'text');
  }, (e) => e is DomException && e.name == DomException.NO_MODIFICATION_ALLOWED);

  shouldThrow(() {
    div.insertAdjacentHtml('FOO', 'text');
  }, (e) => e is DomException && e.name == DomException.SYNTAX);

  shouldThrow(() {
    document.documentElement.insertAdjacentHtml('afterEnd', 'text');
  }, (e) => e is DomException && e.name == DomException.NO_MODIFICATION_ALLOWED);
}
