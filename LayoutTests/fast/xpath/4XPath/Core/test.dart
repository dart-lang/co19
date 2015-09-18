library test;

import "dart:html";

Document DOM = (new DomParser()).parseFromString(
    '<?xml version="1.0" encoding="ISO-8859-1"?>' +
    '<!DOCTYPE ROOT [' +
    '  <!ELEMENT CHILD2 (#PCDATA|GCHILD)*>' +
    '  <!ATTLIST CHILD2 attr1 CDATA #IMPLIED' +
    '                   CODE ID #REQUIRED>' +
    ']>' +
    '<?xml-stylesheet "Data" ?>' +
    '<ROOT>' +
    '  <!-- Test Comment -->' +
    '  <CHILD1 attr1="val1" attr31="31">' +
    '    <GCHILD name="GCHILD11"/>' +
    '    <GCHILD name="GCHILD12"/>' +
    '    Text1' +
    '  </CHILD1>' +
    '  <CHILD2 attr1="val2" CODE="1">' +
    '    <GCHILD name="GCHILD21"/>' +
    '    <GCHILD name="GCHILD22"/>' +
    '  </CHILD2>' +
    '  <foo:CHILD3 xmlns:foo="http://foo.com" foo:name="mike"/>' +
    '  <lang xml:lang="en">' +
    '    <foo xml:lang=""/>' +
    '    <foo/>' +
    '    <f\xf6\xf8/>' +
    '  </lang>' +
    '</ROOT>' +
    '<?no-data ?>',
    'application/xml');

var ROOT = DOM.documentElement;

var PI = ((){
  var res=DOM.firstChild;
  while (res.nodeType != Node.PROCESSING_INSTRUCTION_NODE) {
    res = res.nextNode;
    if (res==null) {
      return null;
    }    
  }
  return res;
  })();
var PI2 = DOM.lastChild;
var COMMENT = ((){
  var res=ROOT.firstChild;
  while (res.nodeType != Node.COMMENT_NODE && res.nodeType != Node.TEXT_NODE) {
    res = res.nextNode;
    if (res==null) {
      return null;
    }    
  }
  return res;
  })();

var CHILD1 = DOM.getElementsByTagName("CHILD1")[0];
var ATTR1 = CHILD1.getAttribute("attr1");
var ATTR31 = CHILD1.getAttribute("attr31");
var CHILD2 = DOM.getElementsByTagName("CHILD2")[0];
var ATTR2 = CHILD2.getAttribute("attr1");
var IDATTR2 = CHILD2.getAttribute('CODE');
/* CHILD3 = DOM.getElementsByTagName("CHILD3")[0];
if (!CHILD3)
    CHILD3 = DOM.getElementsByTagName("foo:CHILD3")[0];
*/
var CHILD3 = ((){
    var childs3 = DOM.getElementsByTagName("CHILD3");
    if (childs3.length!=0) {
       return childs3[0];
    }
    return DOM.getElementsByTagName("foo:CHILD3")[0];
  })();

var text = CHILD1.lastChild;
var LANG = DOM.getElementsByTagName("lang")[0];
var NONASCIIQNAME = DOM.getElementsByTagName("f\xf6\xf8")[0];

var CHILDREN = [CHILD1, CHILD2, CHILD3, LANG];
var GCHILDREN1 = [CHILD1.queryAll("GCHILD")[0], CHILD1.queryAll("GCHILD")[1]];
var GCHILD11 = GCHILDREN1[0];
var GCHILD12 = GCHILDREN1[1];
var TEXT1 = CHILD1.lastChild;
var GCHILDREN2 = [CHILD2.queryAll("GCHILD")[0], CHILD2.queryAll("GCHILD")[1]];
var GCHILD21 = GCHILDREN2[0];
var GCHILD22 = GCHILDREN2[1];
var LCHILDREN = [LANG.queryAll("foo")[0], LANG.queryAll("foo")[1], LANG.queryAll("f\xf6\xf8")[0]];
var LCHILD1 = LCHILDREN[0];
var LCHILD2 = LCHILDREN[1];
