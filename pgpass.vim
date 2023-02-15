" Vim syntax file
" Language:     pgpass
" Maintainer:   burrscurr <https://github.com/burrscurr/vim-pgpass>
" Filenames:    *.pgpass
" Last Change:  2023 Feb 23

if exists("b:current_syntax")
    finish
endif

" match regions for each section of a line that is no comment
syn match pgpassHostname "^[^:]*:" contains=pgpassSeparator,pgpassAsterisk nextgroup=pgpassPort
syn match pgpassPort "[^:]*:" contained contains=pgpassSeparator,pgpassAsterisk nextgroup=pgpassDatabase
syn match pgpassDatabase "[^:]*:" contained contains=pgpassSeparator,pgpassAsterisk nextgroup=pgpassUsername
syn match pgpassUsername "[^:]*:" contained contains=pgpassSeparator,pgpassAsterisk nextgroup=pgpassPassword
syn match pgpassPassword "[^:]*" contained contains=pgpassSeparator,pgpassAsterisk nextgroup=pgpassJunk
" This is matched if there is a colon-separated section after the password.
syn match pgpassJunk ".\+$" contained

syn match pgpassSeparator ':'
syn match pgpassAsterisk '*'
syn match pgpassComment '#.*$'

let b:current_syntax = "pgpass"

hi def link pgpassSeparator Delimiter
hi def link pgpassAsterisk Statement
hi def link pgpassComment Comment

hi def link pgpassHostname  Type
hi def link pgpassPort      Constant
hi def link pgpassDatabase  Identifier
hi def link pgpassUsername  Type
hi def link pgpassPassword  PreProc
hi def link pgpassJunk      Error
