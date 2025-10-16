" substrata_insp_cterm.vim — Substrata without GUI/true-color
set background=dark
hi clear
let g:colors_name = 'substrata_insp_cterm'

" Only cterm detection
let s:t_Co = exists('&t_Co') && &t_Co > 1 ? &t_Co : 2
let s:italics = 1
if s:t_Co >= 256
  if !exists('g:substrata_italic_comments')
    let g:substrata_italic_comments = 1
  endif
  if !exists('g:substrata_italic_functions')
    let g:substrata_italic_functions = 1
  endif

  hi Normal       ctermfg=146 ctermbg=234 cterm=NONE
  hi Cursor       ctermfg=234 ctermbg=189 cterm=NONE
  hi None         ctermfg=NONE ctermbg=NONE cterm=NONE
  hi CursorLineNr ctermfg=242 ctermbg=235 cterm=NONE
  hi FoldColumn   ctermfg=238 ctermbg=NONE cterm=NONE
  hi Folded       ctermfg=242 ctermbg=235 cterm=NONE
  hi LineNr       ctermfg=238 ctermbg=NONE cterm=NONE
  hi MatchParen   ctermfg=189 ctermbg=236 cterm=bold
  hi SignColumn   ctermfg=238 ctermbg=NONE cterm=NONE
  hi Ignore       ctermfg=238 ctermbg=NONE cterm=NONE
  hi Pmenu        ctermfg=242 ctermbg=235 cterm=NONE
  hi PmenuSbar    ctermfg=235 ctermbg=235 cterm=NONE
  hi PmenuSel     ctermfg=189 ctermbg=236 cterm=NONE
  hi PmenuThumb   ctermfg=235 ctermbg=235 cterm=NONE
  hi ErrorMsg     ctermfg=216 ctermbg=NONE cterm=NONE
  hi ModeMsg      ctermfg=60  ctermbg=NONE cterm=NONE
  hi MoreMsg      ctermfg=110 ctermbg=NONE cterm=NONE
  hi Question     ctermfg=110 ctermbg=NONE cterm=NONE
  hi WarningMsg   ctermfg=179 ctermbg=NONE cterm=NONE
  hi ColorColumn  ctermfg=NONE ctermbg=235 cterm=NONE
  hi CursorColumn ctermfg=NONE ctermbg=235 cterm=NONE
  hi CursorLine   ctermfg=NONE ctermbg=235 cterm=NONE
  hi QuickFixLine ctermfg=NONE ctermbg=236 cterm=NONE
  hi StatusLine   ctermfg=234 ctermbg=135 cterm=NONE
  hi StatusLineNC ctermfg=232  ctermbg=245 cterm=NONE
  hi VertSplit    ctermfg=238 ctermbg=NONE cterm=NONE
  hi WildMenu     ctermfg=234 ctermbg=146 cterm=NONE
  hi IncSearch    ctermfg=234 ctermbg=146 cterm=NONE
  hi Search       ctermfg=234 ctermbg=67  cterm=NONE
  hi Visual       ctermfg=NONE ctermbg=237 cterm=NONE
  hi DiffAdd      ctermfg=114 ctermbg=234 cterm=NONE
  hi DiffChange   ctermfg=NONE ctermbg=235 cterm=NONE
  hi DiffDelete   ctermfg=216 ctermbg=234 cterm=NONE
  hi DiffText     ctermfg=179 ctermbg=234 cterm=NONE
  hi Comment      ctermfg=60  ctermbg=NONE cterm=italic
  hi Constant     ctermfg=139 ctermbg=NONE cterm=NONE
  hi Error        ctermfg=173 ctermbg=NONE cterm=NONE
  hi PreProc      ctermfg=67  ctermbg=NONE cterm=NONE
  hi Special      ctermfg=116 ctermbg=NONE cterm=NONE
  hi Statement    ctermfg=67  ctermbg=NONE cterm=NONE
  hi Type         ctermfg=139 ctermbg=NONE cterm=NONE
  hi Delimiter    ctermfg=242 ctermbg=NONE cterm=NONE
  hi Directory    ctermfg=67  ctermbg=NONE cterm=NONE
  hi Function     ctermfg=110 ctermbg=NONE cterm=italic
  hi Operator     ctermfg=242 ctermbg=NONE cterm=NONE
  hi SpecialComment ctermfg=189 ctermbg=NONE cterm=italic
  hi String       ctermfg=73  ctermbg=NONE cterm=NONE
  hi Title        ctermfg=189 ctermbg=NONE cterm=NONE
  hi Todo         ctermfg=189 ctermbg=NONE cterm=NONE
  hi Typedef      ctermfg=182 ctermbg=NONE cterm=NONE
  hi Underlined   ctermfg=110 ctermbg=NONE cterm=underline
  hi vimOption    ctermfg=110 ctermbg=NONE cterm=NONE
  hi SpellBad     ctermfg=173 ctermbg=NONE cterm=undercurl
  hi SpellCap     ctermfg=110 ctermbg=NONE cterm=undercurl
  hi SpellLocal   ctermfg=139 ctermbg=NONE cterm=undercurl
  hi SpellRare    ctermfg=67  ctermbg=NONE cterm=undercurl


  hi DiagnosticError  ctermfg=197
  hi DiagnosticWarn ctermfg=13
  hi DiagnosticInfo ctermfg=Blue
  hi DiagnosticHint ctermfg=Green







  " Optional: remove italics if disabled
  if !g:substrata_italic_comments
    hi Comment        cterm=NONE
    hi SpecialComment cterm=NONE
  endif
  if !g:substrata_italic_functions
    hi Function       cterm=NONE
  endif

  " Links (unchanged from original but no GUI)
  hi! link Terminal Normal
  hi! link TabLine StatusLineNC
  hi! link TabLineFill StatusLineNC
  hi! link TabLineSel StatusLine
  hi! link StatusLineTerm StatusLine
  hi! link StatusLineTermNC StatusLineNC
  hi! link VisualNOS Visual
  hi! link diffAdded DiffAdd
  hi! link diffBDiffer WarningMsg
  hi! link diffChanged DiffChange
  hi! link diffCommon WarningMsg
  hi! link diffDiffer WarningMsg
  hi! link diffFile Directory
  hi! link diffIdentical WarningMsg
  hi! link diffIndexLine Number
  hi! link diffIsA WarningMsg
  hi! link diffNoEOL WarningMsg
  hi! link diffOnly WarningMsg
  hi! link diffRemoved DiffDelete
  hi! link Boolean Constant
  hi! link Character Constant
  hi! link Float Constant
  hi! link Number Constant
  hi! link StorageClass Statement
  hi! link Conditional Statement
  hi! link Exception Statement
  hi! link Keyword Statement
  hi! link Label Statement
  hi! link Repeat Statement
  hi! link Define PreProc
  hi! link Include PreProc
  hi! link Macro PreProc
  hi! link PreCondit PreProc
  hi! link Structure Type
  hi! link Typedef Type
  hi! link Debug Special
  hi! link SpecialChar Special
  hi! link Tag Special
  hi! link Noise Delimiter
  hi! link StringDelimiter Delimiter
  hi! link Conceal Ignore
  hi! link NonText Ignore
  hi! link SpecialKey Ignore
  hi! link EndOfBuffer Ignore
  hi! link Whitespace Ignore
  hi! link Identifier None
  hi! link Searchlight IncSearch
  hi! link cssBraces Delimiter
  hi! link gitcommitOverflow Error
  hi! link gitcommitSummary Title
  hi! link helpHyperTextJump Underlined
  hi! link htmlArg Function
  hi! link htmlEndTag Delimiter
  hi! link htmlLink Underlined
  hi! link htmlSpecialTagName htmlTagName
  hi! link htmlTag Delimiter
  hi! link htmlTagName Statement
  hi! link rustAttribute Delimiter
  hi! link rustDerive rustAttribute
  hi! link rustDeriveTrait rustDerive
  hi! link rustIdentifier Typedef
  hi! link rustModPath None
  hi! link rustSigil Delimiter
  hi! link scssAttribute Delimiter
  hi! link vimAutoCmdSfxList Type
  hi! link vimAutoEventList Identifier
  hi! link vimCmdSep Special
  hi! link vimCommentTitle SpecialComment
  hi! link vimContinue Delimiter
  hi! link vimHighlight Statement
  hi! link vimUserFunc Function
  hi markdownBold   ctermfg=NONE ctermbg=NONE cterm=bold
  hi markdownItalic ctermfg=NONE ctermbg=NONE cterm=italic
  hi markdownUrl    ctermfg=60   ctermbg=NONE cterm=underline
  hi markdownCode   ctermfg=NONE ctermbg=235  cterm=NONE
  hi markdownFaded  ctermfg=60   ctermbg=NONE cterm=NONE
  hi! link markdownBlockquote None
  hi! link markdownCodeBlock markdownCode
  hi! link markdownCodeDelimiter markdownCode
  hi! link markdownH1Delimiter markdownH1
  hi! link markdownH2Delimiter markdownH2
  hi! link markdownH3Delimiter markdownH3
  hi! link markdownH4Delimiter markdownH4
  hi! link markdownH5Delimiter markdownH5
  hi! link markdownH6Delimiter markdownH6
  hi! link markdownId markdownFaded
  hi! link markdownIdDeclaration markdownFaded
  hi! link markdownLinkDelimiter markdownFaded
  hi! link markdownLinkText None
  hi! link markdownLinkTextDelimiter markdownFaded
  hi! link markdownListMarker markdownFaded
  hi! link markdownRule None
  if !s:italics
    hi markdownItalic cterm=NONE
  endif

  unlet s:t_Co s:italics
endif

