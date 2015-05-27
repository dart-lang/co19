/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test reflecting boolean attributes.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var tag, attribute, contentAttribute, e;

  //---
  tag = "select"; attribute = "multiple";
  debug(tag);
  contentAttribute = attribute.toLowerCase();

  e = document.createElement(tag);
  e.attributes.remove(contentAttribute);
  shouldBeFalse(e.multiple);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, '');
  shouldBeTrue(e.multiple);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.multiple = false;
  shouldBeNull(e.getAttribute(contentAttribute));

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.multiple = true;
  shouldBe(e.getAttribute(contentAttribute), '');

  //---
  tag = "option"; attribute = "defaultSelected";
  debug(tag);
  contentAttribute = "selected";

  e = document.createElement(tag);
  e.attributes.remove(contentAttribute);
  shouldBeFalse(e.defaultSelected);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, '');
  shouldBeTrue(e.defaultSelected);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.defaultSelected = false;
  shouldBeNull(e.getAttribute(contentAttribute));

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.defaultSelected = true;
  shouldBe(e.getAttribute(contentAttribute), '');

  //---
  tag = "link"; attribute = "disabled";
  debug(tag);
  contentAttribute = attribute.toLowerCase();

  e = document.createElement(tag);
  e.attributes.remove(contentAttribute);
  shouldBeFalse(e.disabled);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, '');
  shouldBeTrue(e.disabled);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.disabled = false;
  shouldBeNull(e.getAttribute(contentAttribute));

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.disabled = true;
  shouldBe(e.getAttribute(contentAttribute), '');

  //---
  tag = "input"; attribute = "required";
  debug(tag);
  contentAttribute = attribute.toLowerCase();

  e = document.createElement(tag);
  e.attributes.remove(contentAttribute);
  shouldBeFalse(e.required);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, '');
  shouldBeTrue(e.required);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.required = false;
  shouldBeNull(e.getAttribute(contentAttribute));

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.required = true;
  shouldBe(e.getAttribute(contentAttribute), '');

  //---
  tag = "input"; attribute = "readOnly";
  debug(tag);
  contentAttribute = attribute.toLowerCase();

  e = document.createElement(tag);
  e.attributes.remove(contentAttribute);
  shouldBeFalse(e.readOnly);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, '');
  shouldBeTrue(e.readOnly);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.readOnly = false;
  shouldBeNull(e.getAttribute(contentAttribute));

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.readOnly = true;
  shouldBe(e.getAttribute(contentAttribute), '');

  //---
  tag = "input"; attribute = "multiple";
  debug(tag);
  contentAttribute = attribute.toLowerCase();

  e = document.createElement(tag);
  e.attributes.remove(contentAttribute);
  shouldBeFalse(e.multiple);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, '');
  shouldBeTrue(e.multiple);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.multiple = false;
  shouldBeNull(e.getAttribute(contentAttribute));

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.multiple = true;
  shouldBe(e.getAttribute(contentAttribute), '');

  //---
  tag = "input"; attribute = "formNoValidate";
  debug(tag);
  contentAttribute = attribute.toLowerCase();

  e = document.createElement(tag);
  e.attributes.remove(contentAttribute);
  shouldBeFalse(e.formNoValidate);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, '');
  shouldBeTrue(e.formNoValidate);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.formNoValidate = false;
  shouldBeNull(e.getAttribute(contentAttribute));

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.formNoValidate = true;
  shouldBe(e.getAttribute(contentAttribute), '');

  //---
  tag = "input"; attribute = "disabled";
  debug(tag);
  contentAttribute = attribute.toLowerCase();

  e = document.createElement(tag);
  e.attributes.remove(contentAttribute);
  shouldBeFalse(e.disabled);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, '');
  shouldBeTrue(e.disabled);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.disabled = false;
  shouldBeNull(e.getAttribute(contentAttribute));

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.disabled = true;
  shouldBe(e.getAttribute(contentAttribute), '');

  //---
  tag = "input"; attribute = "defaultChecked";
  debug(tag);
  contentAttribute = "checked";

  e = document.createElement(tag);
  e.attributes.remove(contentAttribute);
  shouldBeFalse(e.defaultChecked);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, '');
  shouldBeTrue(e.defaultChecked);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.defaultChecked = false;
  shouldBeNull(e.getAttribute(contentAttribute));

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.defaultChecked = true;
  shouldBe(e.getAttribute(contentAttribute), '');

  //---
  tag = "input"; attribute = "autofocus";
  debug(tag);
  contentAttribute = attribute.toLowerCase();

  e = document.createElement(tag);
  e.attributes.remove(contentAttribute);
  shouldBeFalse(e.autofocus);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, '');
  shouldBeTrue(e.autofocus);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.autofocus = false;
  shouldBeNull(e.getAttribute(contentAttribute));

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.autofocus = true;
  shouldBe(e.getAttribute(contentAttribute), '');

  //---
  tag = "img"; attribute = "isMap";
  debug(tag);
  contentAttribute = attribute.toLowerCase();

  e = document.createElement(tag);
  e.attributes.remove(contentAttribute);
  shouldBeFalse(e.isMap);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, '');
  shouldBeTrue(e.isMap);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.isMap = false;
  shouldBeNull(e.getAttribute(contentAttribute));

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.isMap = true;
  shouldBe(e.getAttribute(contentAttribute), '');

  //---
  tag = "form"; attribute = "noValidate";
  debug(tag);
  contentAttribute = attribute.toLowerCase();

  e = document.createElement(tag);
  e.attributes.remove(contentAttribute);
  shouldBeFalse(e.noValidate);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, '');
  shouldBeTrue(e.noValidate);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.noValidate = false;
  shouldBeNull(e.getAttribute(contentAttribute));

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.noValidate = true;
  shouldBe(e.getAttribute(contentAttribute), '');

  //---
  tag = "script"; attribute = "defer";
  debug(tag);
  contentAttribute = attribute.toLowerCase();

  e = document.createElement(tag);
  e.attributes.remove(contentAttribute);
  shouldBeFalse(e.defer);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, '');
  shouldBeTrue(e.defer);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.defer = false;
  shouldBeNull(e.getAttribute(contentAttribute));

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.defer = true;
  shouldBe(e.getAttribute(contentAttribute), '');

  //---
  tag = "video"; attribute = "autoplay";
  debug(tag);
  contentAttribute = attribute.toLowerCase();

  e = document.createElement(tag);
  e.attributes.remove(contentAttribute);
  shouldBeFalse(e.autoplay);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, '');
  shouldBeTrue(e.autoplay);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.autoplay = false;
  shouldBeNull(e.getAttribute(contentAttribute));

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.autoplay = true;
  shouldBe(e.getAttribute(contentAttribute), '');

  //---
  tag = "video"; attribute = "controls";
  debug(tag);
  contentAttribute = attribute.toLowerCase();

  e = document.createElement(tag);
  e.attributes.remove(contentAttribute);
  shouldBeFalse(e.controls);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, '');
  shouldBeTrue(e.controls);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.controls = false;
  shouldBeNull(e.getAttribute(contentAttribute));

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.controls = true;
  shouldBe(e.getAttribute(contentAttribute), '');

  //---
  tag = "video"; attribute = "loop";
  debug(tag);
  contentAttribute = attribute.toLowerCase();

  e = document.createElement(tag);
  e.attributes.remove(contentAttribute);
  shouldBeFalse(e.loop);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, '');
  shouldBeTrue(e.loop);

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.loop = false;
  shouldBeNull(e.getAttribute(contentAttribute));

  e = document.createElement(tag);
  e.setAttribute(contentAttribute, 'x');
  e.loop = true;
  shouldBe(e.getAttribute(contentAttribute), '');
}
