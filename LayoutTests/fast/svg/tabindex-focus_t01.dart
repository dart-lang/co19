/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Tabindex on svg elements tests
 */
import "dart:html";
import "../../testharness.dart";

const String htmlEL2 = r'''
<div id="testcontainer"><svg id="testroot" width="1" height="1"/></div>
<div id=log></div>
''';

var svg = document.getElementById("testroot");

bool isFocusable(elm) {
	switch (elm.nodeName) {
		case "a":
			return elm.getAttributeNS("http://www.w3.org/1999/xlink", "href")!=null;
		default:
			return false;
	}
}

bool isFocusableWithTabindex(elm) {
	switch (elm.nodeName) {
		case "a":
		case "circle":
		case "ellipse":
		case "foreignObject":
		case "g":
		case "image":
		case "line":
		case "path":
		case "polygon":
		case "polyline":
		case "rect":
		case "svg":
		case "switch":
		case "text":
			return true;
		case "textPath":
		//case "tref": /* not supported */
		case "tspan":
			// only if inside a <text> element
			return elm.parentNode.nodeName == "text";
		case "use":
			return true;
		default:
			return false;
	}
}

void createSvg() {
  var svgelements = [
		"a",
		"altGlyph",
		"altGlyphDef",
		"altGlyphItem",
		"animate",
		"animateColor",
		"animateMotion",
		"animateTransform",
		"circle",
		"clipPath",
		"color-profile",
		"cursor",
		"definition-src",
		"defs",
		"desc",
		"ellipse",
		"feBlend",
		"feColorMatrix",
		"feComponentTransfer",
		"feComposite",
		"feConvolveMatrix",
		"feDiffuseLighting",
		"feDisplacementMap",
		"feDistantLight",
		"feFlood",
		"feFuncA",
		"feFuncB",
		"feFuncG",
		"feFuncR",
		"feGaussianBlur",
		"feImage",
		"feMerge",
		"feMergeNode",
		"feMorphology",
		"feOffset",
		"fePointLight",
		"feSpecularLighting",
		"feSpotLight",
		"feTile",
		"feTurbulence",
		"filter",
		"font",
		"font-face",
		"font-face-format",
		"font-face-name",
		"font-face-src",
		"font-face-uri",
		"foreignObject",
		"g",
		"glyph",
		"glyphRef",
		"hkern",
		"image",
		"line",
		"linearGradient",
		"marker",
		"mask",
		"metadata",
		"missing-glyph",
		"mpath",
		"path",
		"pattern",
		"polygon",
		"polyline",
		"radialGradient",
		"rect",
		"script",
		"set",
		"stop",
		"style",
		"svg",
		"switch",
		"symbol",
		"text",
		"textPath",
		"title",
		"tref",
		"tspan",
		"use",
		"view",
		"vkern"];
  for (var i = 0; i < svgelements.length; i++) {
	svg.append(document.createElementNS("http://www.w3.org/2000/svg", svgelements[i]));
  }
}

void setupTextContentElements() {
  // specialcases for the text content elements

  // cleanup any old content
  while(svg.firstChild!=null) {
	svg.firstChild.remove();
  }
  
  var textContentChildElements = ["textPath", "tref", "tspan"];
  for (var i = 0; i < textContentChildElements.length; i++) {
	var text = document.createElementNS("http://www.w3.org/2000/svg", "text");
	text.append(document.createElementNS("http://www.w3.org/2000/svg", textContentChildElements[i]));
	svg.append(text);
  }
}

void main() {
    document.body.appendHtml(htmlEL2);
    
    createSvg();
    var children=svg.children;
    while(children.length!=0) {
        var element = children.first;
        test(() {
            try {
                element.focus();
                assert_equals(document.activeElement, isFocusable(element) ? element : document.body);
            }
            finally {
                document.body.focus();
            }
        }, "${element.nodeName}.focus() without tabindex set.");
        test(() {
            try {
                element.setAttribute("tabindex", "1");
                element.focus();
                assert_equals(document.activeElement, isFocusableWithTabindex(element) ? element : document.body);
                element.attributes.remove("tabindex");
            }
            finally {
                document.body.focus();
            }
        }, "${element.nodeName}.focus() with tabindex set.");
    
        element.remove();
    }

    checkTestFailures();
}
