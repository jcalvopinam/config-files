"use strict";var obsidian=require("obsidian"),extendStatics=function(t,e){return(extendStatics=Object.setPrototypeOf||({__proto__:[]})instanceof Array&&function(t,e){t.__proto__=e}||function(t,e){for(var n in e)Object.prototype.hasOwnProperty.call(e,n)&&(t[n]=e[n])})(t,e)};function __extends(t,e){if("function"!=typeof e&&null!==e)throw TypeError("Class extends value "+String(e)+" is not a constructor or null");function n(){this.constructor=t}extendStatics(t,e),t.prototype=null===e?Object.create(e):(n.prototype=e.prototype,new n)}function __awaiter(t,e,n,i){return new(n||(n=Promise))(function(r,o){function a(t){try{l(i.next(t))}catch(e){o(e)}}function s(t){try{l(i.throw(t))}catch(e){o(e)}}function l(t){var e;t.done?r(t.value):((e=t.value)instanceof n?e:new n(function(t){t(e)})).then(a,s)}l((i=i.apply(t,e||[])).next())})}function __generator(t,e){var n,i,r,o,a={label:0,sent:function(){if(1&r[0])throw r[1];return r[1]},trys:[],ops:[]};return o={next:s(0),throw:s(1),return:s(2)},"function"==typeof Symbol&&(o[Symbol.iterator]=function(){return this}),o;function s(s){return function(l){return function s(l){if(n)throw TypeError("Generator is already executing.");for(;o&&(o=0,l[0]&&(a=0)),a;)try{if(n=1,i&&(r=2&l[0]?i.return:l[0]?i.throw||((r=i.return)&&r.call(i),0):i.next)&&!(r=r.call(i,l[1])).done)return r;switch(i=0,r&&(l=[2&l[0],r.value]),l[0]){case 0:case 1:r=l;break;case 4:return a.label++,{value:l[1],done:!1};case 5:a.label++,i=l[1],l=[0];continue;case 7:l=a.ops.pop(),a.trys.pop();continue;default:if(!(r=(r=a.trys).length>0&&r[r.length-1])&&(6===l[0]||2===l[0])){a=0;continue}if(3===l[0]&&(!r||l[1]>r[0]&&l[1]<r[3])){a.label=l[1];break}if(6===l[0]&&a.label<r[1]){a.label=r[1],r=l;break}if(r&&a.label<r[2]){a.label=r[2],a.ops.push(l);break}r[2]&&a.ops.pop(),a.trys.pop();continue}l=e.call(t,a)}catch(c){l=[6,c],i=0}finally{n=r=0}if(5&l[0])throw l[1];return{value:l[0]?l[1]:void 0,done:!0}}([s,l])}}}function __spreadArrays(){for(var t=0,e=0,n=arguments.length;e<n;e++)t+=arguments[e].length;for(var i=Array(t),r=0,e=0;e<n;e++)for(var o=arguments[e],a=0,s=o.length;a<s;a++,r++)i[r]=o[a];return i}var checkboxRegex=/^(\s*)- \[[^ ]\]/gi,MyPlugin=function(t){function e(){return null!==t&&t.apply(this,arguments)||this}return __extends(e,t),e.prototype.onload=function(){return __awaiter(this,void 0,void 0,function(){var t,e,n=this;return __generator(this,function(i){return console.log("loading "+this.manifest.name),t=new Intl.Collator(navigator.language,{usage:"sort",sensitivity:"base",numeric:!0,ignorePunctuation:!0}).compare,this.compare=t,this.addCommand({id:"sort-alphabetically-with-checkboxes",name:"Sort alphabetically with checkboxes",callback:function(){return n.sortAlphabetically(!1,!1)}}),this.addCommand({id:"sort-list-alphabetically-with-checkboxes",name:"Sort current list alphabetically with checkboxes",callback:function(){return n.sortAlphabetically(!0,!1)}}),this.addCommand({id:"sort-alphabetically",name:"Sort alphabetically",callback:function(){return n.sortAlphabetically(!1,!0)}}),this.addCommand({id:"sort-list-alphabetically",name:"Sort current list alphabetically",callback:function(){return n.sortAlphabetically(!0,!0)}}),this.addCommand({id:"sort-checkboxes",name:"Sort current list by checkboxes",callback:function(){return n.sortListRecursively(!0,function(t,e){return checkboxRegex.test(t.title.source)&&!checkboxRegex.test(e.title.source)?1:!checkboxRegex.test(t.title.source)&&checkboxRegex.test(e.title.source)?-1:0})}}),this.addCommand({id:"sort-length",name:"Sort by length of line",callback:function(){return n.sortLengthOfLine()}}),this.addCommand({id:"sort-headings",name:"Sort headings",callback:function(){return n.sortHeadings()}}),this.addCommand({id:"permute-reverse",name:"Reverse lines",callback:function(){return n.permuteReverse()}}),this.addCommand({id:"permute-shuffle",name:"Shuffle lines",callback:function(){return n.permuteShuffle()}}),e=function(t,e){return n.compare(t.title.formatted.trim(),e.title.formatted.trim())},this.addCommand({id:"sort-list-recursively",name:"Sort current list recursively",callback:function(){return n.sortListRecursively(!0,e)}}),this.addCommand({id:"sort-list-recursively-with-checkboxes",name:"Sort current list recursively with checkboxes",callback:function(){return n.sortListRecursively(!1,e)}}),[2]})})},e.prototype.onunload=function(){console.log("unloading "+this.manifest.name)},e.prototype.sortAlphabetically=function(t,e){var n=this;void 0===t&&(t=!1),void 0===e&&(e=!0);var i=this.getLines(t,e);if(0!==i.length){var r=function(t,e){return n.compare(t.formatted.trim(),e.formatted.trim())};i.sort(r),this.setLines(i,t)}},e.prototype.sortListRecursively=function(t,e){var n=this,i=this.getLines(!0,t);if(!(0===i.length||i.find(function(t){return""==t.source.trim()}))){for(var r=i.first().lineNumber,o=__spreadArrays(Array(r).fill(void 0),i),a=r,s=this.app.metadataCache.getFileCache(this.app.workspace.getActiveFile()),l=[];a<o.length;){var c=this.getSortedListParts(o,s.listItems,a,e);l.push(c),a=c.lastLine,a++}l.sort(e);var u=l.reduce(function(t,e){return t.concat(n.listPartToList(e))},[]);this.setLines(u,!0)}},e.prototype.getLineCacheFromLine=function(t,e){return e.find(function(e){return e.position.start.line===t})},e.prototype.getSortedListParts=function(t,e,n,i){for(var r,o,a,s,l,c=[],u=this.getLineCacheFromLine(n,e),d=t[n];u.parent<(null===(r=this.getLineCacheFromLine(n+1,e))||void 0===r?void 0:r.parent)||u.parent<0&&(null===(o=this.getLineCacheFromLine(n+1,e))||void 0===o?void 0:o.parent)>=0;){n++;var h=this.getSortedListParts(t,e,n,i);n=null!==(a=h.lastLine)&&void 0!==a?a:n,c.push(h)}var f=null!==(l=null===(s=c.last())||void 0===s?void 0:s.lastLine)&&void 0!==l?l:n;return c.sort(i),{children:c,title:d,lastLine:f}},e.prototype.listPartToList=function(t){var e=this;return t.children.reduce(function(t,n){return t.concat(e.listPartToList(n))},[t.title])},e.prototype.sortHeadings=function(){var t=this.getLines(),e=this.getSortedHeadings(t,0,{headingLevel:0,formatted:"",source:"",lineNumber:-1});this.setLines(this.headingsToString(e).slice(1))},e.prototype.headingsToString=function(t){var e=this,n=__spreadArrays([t.title],t.lines);return t.headings.forEach(function(t){return n.push.apply(n,e.headingsToString(t))}),n},e.prototype.getSortedHeadings=function(t,e,n){for(var i=this,r=[],o=[],a=e;a<t.length;){var s=t[a];if(s.headingLevel<=n.headingLevel)break;s.headingLevel?(r.push(this.getSortedHeadings(t,a+1,s)),a=r.last().to):o.push(s),a++}return{lines:o,to:r.length>0?r.last().to:a-1,headings:r.sort(function(t,e){var n=t.title.headingLevel-e.title.headingLevel;return 0==n?i.compare(t.title.formatted.trim(),e.title.formatted.trim()):n}),title:n}},e.prototype.sortLengthOfLine=function(){var t=this.getLines();0!==t.length&&(t.sort(function(t,e){return t.formatted.length-e.formatted.length}),this.setLines(t))},e.prototype.permuteReverse=function(){var t=this.getLines();0!==t.length&&(t.reverse(),this.setLines(t))},e.prototype.permuteShuffle=function(){var t=this.getLines();0!==t.length&&(t.shuffle(),this.setLines(t))},e.prototype.getLines=function(t,e){void 0===t&&(t=!1),void 0===e&&(e=!0);var n,i,r=this.app.workspace.getActiveViewOfType(obsidian.MarkdownView);if(r){var o=r.editor,a=r.file,s=o.getValue().split("\n"),l=this.app.metadataCache.getFileCache(a),c=this.getPosition(r,t),u=c.start,d=c.end,h=l.headings,f=__spreadArrays(null!==(n=null==l?void 0:l.links)&&void 0!==n?n:[],null!==(i=null==l?void 0:l.embeds)&&void 0!==i?i:[]),p=s.map(function(t,n){var i={source:t,formatted:t,headingLevel:void 0,lineNumber:n};return f.forEach(function(e){if(e.position.start.line==n){var r=e.position.start,o=e.position.end;i.formatted=i.formatted.replace(t.substring(r.col,o.col),e.displayText)}}),e?i.formatted=i.formatted.replace(checkboxRegex,"$1"):i.formatted=i.formatted.replace(checkboxRegex,"$1ZZZZZZZZZZZZZZZZZZZZZZZZZ"),i});return(null==h||h.map(function(t){return p[t.position.start.line].headingLevel=t.level}),u!=d)?p.slice(u,d+1):p}},e.prototype.setLines=function(t,e){void 0===e&&(e=!1);var n=this.app.workspace.getActiveViewOfType(obsidian.MarkdownView),i=this.getPosition(n,e),r=n.editor;i.start!=i.end?r.replaceRange(t.map(function(t){return t.source}).join("\n"),{line:i.start,ch:0},{line:i.end,ch:i.endLineLength}):r.setValue(t.map(function(t){return t.source}).join("\n"))},e.prototype.getPosition=function(t,e){void 0===e&&(e=!1);var n,i,r,o=this.app.metadataCache.getFileCache(t.file),a=t.editor,s=a.getCursor("from").line,l=a.getCursor("to").line;if(e){var c=o.sections.find(function(t){return t.position.start.line<=s&&t.position.end.line>=l});c&&(s=c.position.start.line,l=c.position.end.line)}var u=a.getLine(l).length,d=(null===(r=null===(i=null===(n=o.frontmatter)||void 0===n?void 0:n.position)||void 0===i?void 0:i.end)||void 0===r?void 0:r.line)+1;isNaN(d)&&(d=0);var h=a.lastLine(),f=a.getLine(h).length;return s!=l?{start:s,end:l,endLineLength:u}:{start:d,end:h,endLineLength:f}},e}(obsidian.Plugin);module.exports=MyPlugin;var obsidian=require("obsidian"),extendStatics=function(t,e){return(extendStatics=Object.setPrototypeOf||({__proto__:[]})instanceof Array&&function(t,e){t.__proto__=e}||function(t,e){for(var n in e)Object.prototype.hasOwnProperty.call(e,n)&&(t[n]=e[n])})(t,e)};function __extends(t,e){if("function"!=typeof e&&null!==e)throw TypeError("Class extends value "+String(e)+" is not a constructor or null");function n(){this.constructor=t}extendStatics(t,e),t.prototype=null===e?Object.create(e):(n.prototype=e.prototype,new n)}function __awaiter(t,e,n,i){return new(n||(n=Promise))(function(r,o){function a(t){try{l(i.next(t))}catch(e){o(e)}}function s(t){try{l(i.throw(t))}catch(e){o(e)}}function l(t){var e;t.done?r(t.value):((e=t.value)instanceof n?e:new n(function(t){t(e)})).then(a,s)}l((i=i.apply(t,e||[])).next())})}function __generator(t,e){var n,i,r,o,a={label:0,sent:function(){if(1&r[0])throw r[1];return r[1]},trys:[],ops:[]};return o={next:s(0),throw:s(1),return:s(2)},"function"==typeof Symbol&&(o[Symbol.iterator]=function(){return this}),o;function s(s){return function(l){return function s(l){if(n)throw TypeError("Generator is already executing.");for(;o&&(o=0,l[0]&&(a=0)),a;)try{if(n=1,i&&(r=2&l[0]?i.return:l[0]?i.throw||((r=i.return)&&r.call(i),0):i.next)&&!(r=r.call(i,l[1])).done)return r;switch(i=0,r&&(l=[2&l[0],r.value]),l[0]){case 0:case 1:r=l;break;case 4:return a.label++,{value:l[1],done:!1};case 5:a.label++,i=l[1],l=[0];continue;case 7:l=a.ops.pop(),a.trys.pop();continue;default:if(!(r=(r=a.trys).length>0&&r[r.length-1])&&(6===l[0]||2===l[0])){a=0;continue}if(3===l[0]&&(!r||l[1]>r[0]&&l[1]<r[3])){a.label=l[1];break}if(6===l[0]&&a.label<r[1]){a.label=r[1],r=l;break}if(r&&a.label<r[2]){a.label=r[2],a.ops.push(l);break}r[2]&&a.ops.pop(),a.trys.pop();continue}l=e.call(t,a)}catch(c){l=[6,c],i=0}finally{n=r=0}if(5&l[0])throw l[1];return{value:l[0]?l[1]:void 0,done:!0}}([s,l])}}}function __spreadArrays(){for(var t=0,e=0,n=arguments.length;e<n;e++)t+=arguments[e].length;for(var i=Array(t),r=0,e=0;e<n;e++)for(var o=arguments[e],a=0,s=o.length;a<s;a++,r++)i[r]=o[a];return i}var checkboxRegex=/^(\s*)- \[[^ ]\]/gi,MyPlugin=function(t){function e(){return null!==t&&t.apply(this,arguments)||this}return __extends(e,t),e.prototype.onload=function(){return __awaiter(this,void 0,void 0,function(){var t,e,n=this;return __generator(this,function(i){return console.log("loading "+this.manifest.name),t=new Intl.Collator(navigator.language,{usage:"sort",sensitivity:"base",numeric:!0,ignorePunctuation:!0}).compare,this.compare=t,this.addCommand({id:"sort-alphabetically-with-checkboxes",name:"Sort alphabetically with checkboxes",callback:function(){return n.sortAlphabetically(!1,!1)}}),this.addCommand({id:"sort-list-alphabetically-with-checkboxes",name:"Sort current list alphabetically with checkboxes",callback:function(){return n.sortAlphabetically(!0,!1)}}),this.addCommand({id:"sort-alphabetically",name:"Sort alphabetically",callback:function(){return n.sortAlphabetically(!1,!0)}}),this.addCommand({id:"sort-list-alphabetically",name:"Sort current list alphabetically",callback:function(){return n.sortAlphabetically(!0,!0)}}),this.addCommand({id:"sort-checkboxes",name:"Sort current list by checkboxes",callback:function(){return n.sortListRecursively(!0,function(t,e){return checkboxRegex.test(t.title.source)&&!checkboxRegex.test(e.title.source)?1:!checkboxRegex.test(t.title.source)&&checkboxRegex.test(e.title.source)?-1:0})}}),this.addCommand({id:"sort-length",name:"Sort by length of line",callback:function(){return n.sortLengthOfLine()}}),this.addCommand({id:"sort-headings",name:"Sort headings",callback:function(){return n.sortHeadings()}}),this.addCommand({id:"permute-reverse",name:"Reverse lines",callback:function(){return n.permuteReverse()}}),this.addCommand({id:"permute-shuffle",name:"Shuffle lines",callback:function(){return n.permuteShuffle()}}),e=function(t,e){return n.compare(t.title.formatted.trim(),e.title.formatted.trim())},this.addCommand({id:"sort-list-recursively",name:"Sort current list recursively",callback:function(){return n.sortListRecursively(!0,e)}}),this.addCommand({id:"sort-list-recursively-with-checkboxes",name:"Sort current list recursively with checkboxes",callback:function(){return n.sortListRecursively(!1,e)}}),[2]})})},e.prototype.onunload=function(){console.log("unloading "+this.manifest.name)},e.prototype.sortAlphabetically=function(t,e){var n=this;void 0===t&&(t=!1),void 0===e&&(e=!0);var i=this.getLines(t,e);if(0!==i.length){var r=function(t,e){return n.compare(t.formatted.trim(),e.formatted.trim())};i.sort(r),this.setLines(i,t)}},e.prototype.sortListRecursively=function(t,e){var n=this,i=this.getLines(!0,t);if(!(0===i.length||i.find(function(t){return""==t.source.trim()}))){for(var r=i.first().lineNumber,o=__spreadArrays(Array(r).fill(void 0),i),a=r,s=this.app.metadataCache.getFileCache(this.app.workspace.getActiveFile()),l=[];a<o.length;){var c=this.getSortedListParts(o,s.listItems,a,e);l.push(c),a=c.lastLine,a++}l.sort(e);var u=l.reduce(function(t,e){return t.concat(n.listPartToList(e))},[]);this.setLines(u,!0)}},e.prototype.getLineCacheFromLine=function(t,e){return e.find(function(e){return e.position.start.line===t})},e.prototype.getSortedListParts=function(t,e,n,i){for(var r,o,a,s,l,c=[],u=this.getLineCacheFromLine(n,e),d=t[n];u.parent<(null===(r=this.getLineCacheFromLine(n+1,e))||void 0===r?void 0:r.parent)||u.parent<0&&(null===(o=this.getLineCacheFromLine(n+1,e))||void 0===o?void 0:o.parent)>=0;){n++;var h=this.getSortedListParts(t,e,n,i);n=null!==(a=h.lastLine)&&void 0!==a?a:n,c.push(h)}var f=null!==(l=null===(s=c.last())||void 0===s?void 0:s.lastLine)&&void 0!==l?l:n;return c.sort(i),{children:c,title:d,lastLine:f}},e.prototype.listPartToList=function(t){var e=this;return t.children.reduce(function(t,n){return t.concat(e.listPartToList(n))},[t.title])},e.prototype.sortHeadings=function(){var t=this.getLines(),e=this.getSortedHeadings(t,0,{headingLevel:0,formatted:"",source:"",lineNumber:-1});this.setLines(this.headingsToString(e).slice(1))},e.prototype.headingsToString=function(t){var e=this,n=__spreadArrays([t.title],t.lines);return t.headings.forEach(function(t){return n.push.apply(n,e.headingsToString(t))}),n},e.prototype.getSortedHeadings=function(t,e,n){for(var i=this,r=[],o=[],a=e;a<t.length;){var s=t[a];if(s.headingLevel<=n.headingLevel)break;s.headingLevel?(r.push(this.getSortedHeadings(t,a+1,s)),a=r.last().to):o.push(s),a++}return{lines:o,to:r.length>0?r.last().to:a-1,headings:r.sort(function(t,e){var n=t.title.headingLevel-e.title.headingLevel;return 0==n?i.compare(t.title.formatted.trim(),e.title.formatted.trim()):n}),title:n}},e.prototype.sortLengthOfLine=function(){var t=this.getLines();0!==t.length&&(t.sort(function(t,e){return t.formatted.length-e.formatted.length}),this.setLines(t))},e.prototype.permuteReverse=function(){var t=this.getLines();0!==t.length&&(t.reverse(),this.setLines(t))},e.prototype.permuteShuffle=function(){var t=this.getLines();0!==t.length&&(t.shuffle(),this.setLines(t))},e.prototype.getLines=function(t,e){void 0===t&&(t=!1),void 0===e&&(e=!0);var n,i,r=this.app.workspace.getActiveViewOfType(obsidian.MarkdownView);if(r){var o=r.editor,a=r.file,s=o.getValue().split("\n"),l=this.app.metadataCache.getFileCache(a),c=this.getPosition(r,t),u=c.start,d=c.end,h=l.headings,f=__spreadArrays(null!==(n=null==l?void 0:l.links)&&void 0!==n?n:[],null!==(i=null==l?void 0:l.embeds)&&void 0!==i?i:[]),p=s.map(function(t,n){var i={source:t,formatted:t,headingLevel:void 0,lineNumber:n};return f.forEach(function(e){if(e.position.start.line==n){var r=e.position.start,o=e.position.end;i.formatted=i.formatted.replace(t.substring(r.col,o.col),e.displayText)}}),e?i.formatted=i.formatted.replace(checkboxRegex,"$1"):i.formatted=i.formatted.replace(checkboxRegex,"$1ZZZZZZZZZZZZZZZZZZZZZZZZZ"),i});return(null==h||h.map(function(t){return p[t.position.start.line].headingLevel=t.level}),u!=d)?p.slice(u,d+1):p}},e.prototype.setLines=function(t,e){void 0===e&&(e=!1);var n=this.app.workspace.getActiveViewOfType(obsidian.MarkdownView),i=this.getPosition(n,e),r=n.editor;i.start!=i.end?r.replaceRange(t.map(function(t){return t.source}).join("\n"),{line:i.start,ch:0},{line:i.end,ch:i.endLineLength}):r.setValue(t.map(function(t){return t.source}).join("\n"))},e.prototype.getPosition=function(t,e){void 0===e&&(e=!1);var n,i,r,o=this.app.metadataCache.getFileCache(t.file),a=t.editor,s=a.getCursor("from").line,l=a.getCursor("to").line;if(e){var c=o.sections.find(function(t){return t.position.start.line<=s&&t.position.end.line>=l});c&&(s=c.position.start.line,l=c.position.end.line)}var u=a.getLine(l).length,d=(null===(r=null===(i=null===(n=o.frontmatter)||void 0===n?void 0:n.position)||void 0===i?void 0:i.end)||void 0===r?void 0:r.line)+1;isNaN(d)&&(d=0);var h=a.lastLine(),f=a.getLine(h).length;return s!=l?{start:s,end:l,endLineLength:u}:{start:d,end:h,endLineLength:f}},e}(obsidian.Plugin);module.exports=MyPlugin;