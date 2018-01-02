" Vim syntax file
" Language:     Homebrew
" Maintainer:   Robert Perce <contact@rperce.net>
" Filenames:    *.homebrew
" Last Change:  2019 Jan 01

if exists("b:current_syntax")
  finish
endif

if !exists('main_syntax')
  let main_syntax = 'homebrew'
endif

runtime! syntax/markdown.vim
unlet! b:current_syntax

" for some reason, markdownBoldItalic isn't in markdownInline
syn cluster markdown contains=@markdownBlock,@markdownInline,markdownBoldItalic
syn cluster hbCContains contains=@markdown,hbCBlock,hbcError,hbCDivider

syn region hbNote start='> ' end='$' oneline contains=@markdown

syn region hbCreature matchgroup=hbCDivider end="^$" start="^___\(\n___\)\?$" contains=@hbCContains
syn match hbCDivider "___" contained

" for some reason "^>[ $]" doesn't work the same way
syn match hbCBlock "^> " contained
syn match hbCBlock "^>$" contained
syn match hbCError "^>[^ ].*" contained
syn match hbCError "^[^>].*" contained

syn match hbPageBreak       "\\page"
syn match hbColumnBreak     "```\n```"

syn region hbDescriptive end="</div>" start='<div class="descriptive">' keepend contains=@markdown

" we can't just say `hi def link hbCreature Error` instead of having the hbCError
" thing, because we want plaintext to not be a failure
hi def link hbcBlock        Special
hi def link hbcDivider      Special
hi def link hbCError        Error
hi def link hbPageBreak     Statement
hi def link hbColumnBreak   Statement
hi def link hbDescriptive   htmlItalic
hi def link hbNote          htmlItalic

let b:current_syntax = "homebrew"
if main_syntax ==# 'homebrew'
  unlet main_syntax
endif

" vim:set sw=2:
