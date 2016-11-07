/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that cycles are not allowed in template content
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  TemplateElement template = document.createElement('template');
  shouldThrow(() => template.content.append(template));
  var outerDiv = document.createElement('div');
  outerDiv.append(template);
  shouldThrow(() => template.content.append(outerDiv));
  var innerDiv = template.content.append(document.createElement('div'));
  shouldThrow(() => innerDiv.append(template));
  shouldThrow(() => innerDiv.append(outerDiv));
  var innerTemplate = innerDiv.append(document.createElement('template'));
  shouldThrow(() => innerTemplate.append(outerDiv));
}
