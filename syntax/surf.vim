if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = "surf"
endif

runtime syntax/html.vim

unlet b:current_syntax

syn cluster htmlPreproc add=surfZone

syn keyword surfTagName exportToJs extends block function
syn keyword surfTagName use surface surfacelist urlaction if else
syn keyword surfTagName elseif call raw for continue break forelse 
syn keyword surfTagName bundle includeJs excludeJs bundleAsync
syn keyword surfTagName forheader forfooter in includeCss excludeCss
syn keyword surfTagName return render empty cache item global asset

syn keyword surfOperators == != > < >= <= === ! % = && ^ / + -

syn match surfConstant "\$surf" 

syn match surfDollarSign      contained "\$"

syn match surfVariable      contained "\$\@<=\h\w*"

syn match surfEscapedVariable contained "\\$\h\w*"

syn region surfStringDouble matchgroup=Constant start=+"+  end=+"+ contained keepend
syn region surfStringSingle matchgroup=Constant start=+'+  end=+'+ contained keepend

syn match surfNumber '\d\+' contained display
syn match surfNumber '[-+]\d\+' contained display
syn match surfNumber '\d\+\.\d*' contained display
syn match surfNumber '[-+]\d\+\.\d*' contained display
syn match surfNumber '[-+]\=\d[[:digit:]]*[eE][\-+]\=\d\+' contained display
syn match surfNumber '\d[[:digit:]]*[eE][\-+]\=\d\+' contained display
syn match surfNumber '[-+]\=\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+' contained display
syn match surfNumber '\d[[:digit:]]*\.\d*[eE][\-+]\=\d\+' contained display

syn match surfGlue "\.\|\->"


syn region surfModifier  matchgroup=Statement start=+|+   end=+\ze:\|\>+

syn region surfZone     matchgroup=Statement   start="{"   end="}" contains=surfParameter, surfGlue, surfModifier, surfDollarSign, surfStringDouble,surfStringSingle, surfVariable, surfString, surfBlock, surfTagName, surfConstant, surfOperators, surfNumber

syn region surfComment  matchgroup=Comment   start="{\*" end="\*}"


hi def link surfTagName         Statement
hi def link surfComment         Comment
hi def link surfOperators       Operator
hi def link surfNumber          Number
hi def link surfBlock           Constant
hi def link surfGlue            Identifier
hi def link surfVariable        Identifier
hi def link surfDollarSign      Identifier
hi def link surfStringDouble    String
hi def link surfStringSingle    String
hi def link surfModifier        Type

let b:current_syntax = "surf"

if main_syntax == "surf"
  unlet main_syntax
endif
