" Vim syntax file
" Language:     pgpass
" Maintainer:   burrscurr <https://github.com/burrscurr/vim-pgpass>
" Filenames:    *.pgpass
" Last Change:  2023 Feb 23

if exists("b:current_syntax")
    finish
endif

syn match pgpassComment '#.*$'
syn match pgpassSeparator ':'
syn match pgpassEscape "\\[\\:]"

let b:current_syntax = "pgpass"

hi def link pgpassSeparator Delimiter
hi def link pgpassComment Comment
hi def link pgpassEscape SpecialChar
