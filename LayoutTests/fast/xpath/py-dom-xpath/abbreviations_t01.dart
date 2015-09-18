/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description 
 */
import "dart:html";
import "../xpath-test-pre.dart";

void main() {
var doc = (new DomParser()).parseFromString(
    '<doc>' +
    '    <para id="1" />' +
    '    <div id="2" />' +
    '    <para id="3" />' +
    '</doc>',
    'application/xml');
test(doc, doc.documentElement, "para", [doc.getElementsByTagName("para")[0], doc.getElementsByTagName("para")[1]]);
test(doc, doc.documentElement, "*", [doc.getElementsByTagName("para")[0], doc.getElementsByTagName("div")[0], doc.getElementsByTagName("para")[1]]);

doc = (new DomParser()).parseFromString('<doc>This is <i>some</i> text.</doc>', 'application/xml');
test(doc, doc.documentElement, "text()", [doc.documentElement.firstChild, doc.documentElement.lastChild]);

doc = (new DomParser()).parseFromString('<doc name="foo" value="bar" />', 'application/xml');
test(doc, doc.documentElement, "@name", [doc.documentElement.getAttribute("name")]);
test(doc, doc.documentElement, "@*", [doc.documentElement.getAttribute("name"), doc.documentElement.getAttribute("value")]);

doc = (new DomParser()).parseFromString('<doc><para id="1" /><para id="2" /><para id="3" /></doc>', 'application/xml');
test(doc, doc.documentElement, "para[1]", [doc.getElementsByTagName("para")[0]]);
test(doc, doc.documentElement, "para[last()]", [doc.getElementsByTagName("para")[2]]);

doc = (new DomParser()).parseFromString(
    '<doc>' +
    '    <chapter><para id="1" /><para id="2" /></chapter>' +
    '    <section><para id="3" /><sub><para id="4" /></sub></section>' +
    '    <para id="4" />' +
    '</doc>',
    'application/xml');
test(doc, doc.documentElement, "*/para", [doc.getElementsByTagName("para")[0], doc.getElementsByTagName("para")[1], doc.getElementsByTagName("para")[2]]);

doc = (new DomParser()).parseFromString(
    '<doc>' +
    '    <chapter id="1" /><chapter id="2" /><chapter id="3" />' +
    '    <chapter id="4">' +
    '      <section id="4.1" /><section id="4.2" /><section id="4.3" />' +
    '    </chapter>' +
    '    <chapter id="5">' +
    '      <section id="5.1" /><section id="5.2" /><section id="5.3" />' +
    '    </chapter>' +
    '</doc>',
    'application/xml');
test(doc, doc.documentElement, "/doc/chapter[5]/section[2]", [doc.getElementsByTagName("section")[4]]);

doc = (new DomParser()).parseFromString(
    '<doc>' +
    '    <chapter><para id="1" /><para id="2" /></chapter>' +
    '    <chapter><section><para id="3" /></section></chapter>' +
    '    <para id="4" />' +
    '</doc>',
    'application/xml');
test(doc, doc.documentElement, "chapter//para", [doc.getElementsByTagName("para")[0], doc.getElementsByTagName("para")[1], doc.getElementsByTagName("para")[2]]);

doc = (new DomParser()).parseFromString(
    '<para id="0">' +
    '    <div id="1" />' +
    '    <para id="2">' +
    '        <para id="3" />' +
    '    </para>' +
    '</para>',
    'application/xml');
test(doc, '//para[@id="2"]', '//para', [doc.getElementsByTagName("para")[0], doc.getElementsByTagName("para")[1], doc.getElementsByTagName("para")[2]]);

doc = (new DomParser()).parseFromString(
    '<doc>' +
    '    <item id="1">' +
    '        <context />' +
    '        <olist><item id="2" /></olist>' +
    '    </item>' +
    '    <olist><item id="3" /></olist>' +
    '</doc>',
    'application/xml');
test(doc, '//context', '//olist/item', [doc.getElementsByTagName("item")[1], doc.getElementsByTagName("item")[2]]);

doc = (new DomParser()).parseFromString(
    '<doc id="0">' +
    '    <para id="1"/>' +
    '</doc>',
    'application/xml');
test(doc, doc.documentElement, '.', [doc.documentElement]);

doc = (new DomParser()).parseFromString(
    '<para id="0">' +
    '    <div id="1" />' +
    '    <para id="2">' +
    '        <para id="3" />' +
    '    </para>' +
    '</para>',
    'application/xml');
test(doc, '//para[@id="2"]', './para', [doc.getElementsByTagName("para")[2]]);

doc = (new DomParser()).parseFromString(
    '<doc id="0">' +
    '    <chapter id="1">' +
    '        <item id="2" />' +
    '        <item id="3"><subitem id="4" /></item>' +
    '    </chapter>' +
    '</doc>',
    'application/xml');
test(doc, '//item[@id="3"]', '..', [doc.getElementsByTagName("chapter")[0]]);

doc = (new DomParser()).parseFromString(
    '<doc id="0">' +
    '    <chapter id="1" lang="en">' +
    '        <item id="2" />' +
    '        <item id="3"><subitem id="4" /></item>' +
    '    </chapter>' +
    '</doc>',
    'application/xml');
test(doc, '//item[@id="3"]', '../@lang', [doc.getElementsByTagName("chapter")[0].getAttribute("lang")]);

doc = (new DomParser()).parseFromString(
    '<doc>' +
    '    <para id="1" type="info" />' +
    '    <para id="2" type="warning" />' +
    '    <para id="3" type="warning" />' +
    '    <para id="4" type="error" />' +
    '</doc>',
    'application/xml');
test(doc, doc.documentElement, 'para[@type="warning"]', [doc.getElementsByTagName("para")[1], doc.getElementsByTagName("para")[2]]);

doc = (new DomParser()).parseFromString(
    '<doc>' +
    '    <para id="1" type="info" />' +
    '    <para id="2" type="warning" />' +
    '    <para id="3" type="warning" />' +
    '    <para id="4" type="warning" />' +
    '    <para id="5" type="error" />' +
    '    <para id="6" type="warning" />' +
    '    <para id="7" type="warning" />' +
    '</doc>',
    'application/xml');
test(doc, doc.documentElement, 'para[@type="warning"][5]', [doc.getElementsByTagName("para")[6]]);
test(doc, doc.documentElement, 'para[5][@type="warning"]', []);

doc = (new DomParser()).parseFromString(
    '<doc>' +
    '    <chapter id="1" />' +
    '    <chapter id="2"><title>Introduction</title></chapter>' +
    '    <chapter id="3"><title>Body</title></chapter>' +
    '    <chapter id="4">' +
    '        <title>Another</title>' +
    '        <title>Introduction</title>' +
    '    </chapter>' +
    '</doc>',
    'application/xml');
test(doc, doc.documentElement, "chapter[title='Introduction']", [doc.getElementsByTagName("chapter")[1], doc.getElementsByTagName("chapter")[3]]);

doc = (new DomParser()).parseFromString(
    '<doc>' +
    '    <chapter id="1" />' +
    '    <chapter id="2"><title /></chapter>' +
    '    <chapter id="3"><title /><title /></chapter>' +
    '</doc>',
    'application/xml');
test(doc, doc.documentElement, "chapter[title]", [doc.getElementsByTagName("chapter")[1], doc.getElementsByTagName("chapter")[2]]);

doc = (new DomParser()).parseFromString(
    '<doc>' +
    '    <employee name="Alice" />' +
    '    <employee name="Bob" secretary="Cathy" />' +
    '    <employee name="Dianne" secretary="Edward" assistant="Fran" />' +
    '</doc>',
    'application/xml');
test(doc, doc.documentElement, "employee[@secretary and @assistant]", [doc.getElementsByTagName("employee")[2]]);

    checkTestFailures();    
}
