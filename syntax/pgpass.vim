" Vim syntax file
" Language:     pgpass
" Homepage:     https://github.com/burrscurr/vim-pgpass
" Maintainer:   burrscurr <https://github.com/burrscurr/vim-pgpass>
" Filenames:    *.pgpass
" Last Change:  2023 Feb 23

" See https://www.postgresql.org/docs/current/libpq-pgpass.html for details.

if exists("b:current_syntax")
    finish
endif

syn match pgpassComment '^#.*$'

" Each section is a sequence of either a normal or a escaped character.
" Following unescaped colon characters mark a section's end.
syn match pgpassHostname "^#\@!\([^\\:]\|\\.\)*:\+" contains=pgpassSeparator,pgpassAsterisk,pgpassEscape,pgpassInvalidEscape,pgpassEmptySection nextgroup=pgpassPort
syn match pgpassPort "\([^\\:]\|\\.\)*:\+" contained contains=pgpassSeparator,pgpassAsterisk,pgpassEscape,pgpassInvalidEscape,pgpassEmptySection nextgroup=pgpassDatabase
syn match pgpassDatabase "\([^\\:]\|\\.\)*:\+" contained contains=pgpassSeparator,pgpassAsterisk,pgpassEscape,pgpassInvalidEscape,pgpassEmptySection nextgroup=pgpassUsername
syn match pgpassUsername "\([^\\:]\|\\.\)*:\+" contained contains=pgpassSeparator,pgpassAsterisk,pgpassEscape,pgpassInvalidEscape,pgpassEmptySection nextgroup=pgpassPassword
syn match pgpassPassword "\([^\\:]\|\\.\)*" contained contains=pgpassSeparator,pgpassAsterisk,pgpassEscape,pgpassInvalidEscape nextgroup=pgpassJunk
syn match pgpassJunk ".\+$" contained

" Special matches within sections
syn match pgpassSeparator ':' contained
syn match pgpassAsterisk '*' contained
syn match pgpassEscape '\\\\\|\\:' contained

" Invalid syntax
syn match pgpassEmptySection '::' contained
syn match pgpassInvalidEscape '\\[^\\:]' contained

hi def link pgpassComment       Comment
hi def link pgpassAsterisk      SpecialChar
hi def link pgpassEscape        SpecialChar

hi def link pgpassHostname      Type
hi def link pgpassPort          Constant
hi def link pgpassDatabase      Identifier
hi def link pgpassUsername      Statement
hi def link pgpassPassword      PreProc

hi def link pgpassJunk          Error
hi def link pgpassEmptySection  Error
hi def link pgpassInvalidEscape Error

let b:current_syntax = "pgpass"
