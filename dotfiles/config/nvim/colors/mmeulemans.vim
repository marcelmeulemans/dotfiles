" By:         Marcel Meulemans
" Modified:   http://hans.fugal.net/vim/colors/desert.vim
" Version:    $Id: mmeulemans.vim,v 1.3 2007-03-15 11:36:08 mmeulemans Exp $

set background=dark
let g:colors_name="mmeulemans"

hi Normal                guifg=White guibg=#222222
hi Cursor                guibg=khaki guifg=slategrey
hi VertSplit             guibg=#c2bfa5 guifg=grey50 gui=none
hi Folded                guibg=grey30 guifg=gold
hi FoldColumn            guibg=grey30 guifg=tan
hi IncSearch             guifg=slategrey guibg=khaki
hi ModeMsg               guifg=goldenrod
hi MoreMsg               guifg=SeaGreen
hi NonText               guifg=LightBlue guibg=grey15
hi Question              guifg=springgreen
hi Search                guibg=peru guifg=wheat
hi SpecialKey            guifg=red
hi StatusLine            guibg=#c2bfa5 guifg=black gui=none
hi StatusLineNC          guibg=#c2bfa5 guifg=grey50 gui=none
hi Title                 guifg=indianred
hi Visual                gui=none guifg=khaki guibg=olivedrab
hi MatchParen            gui=bold guifg=white guibg=grey40
hi WarningMsg            guifg=salmon
hi WildMenu              guibg=khaki
hi cursorline            guibg=grey15
hi Comment               guifg=grey50
hi Constant              guifg=#ffa0a0
hi Identifier            guifg=palegreen
hi Statement             guifg=khaki
hi PreProc               guifg=indianred
hi Type                  guifg=darkkhaki
hi Special               guifg=navajowhite
hi Ignore                guifg=grey40
hi Todo                  guifg=orangered guibg=yellow2
hi MBENormal             guifg=#a09c6d
hi link MBEChanged       Constant
hi MBEVisibleNormal      guifg=gold 
hi MBEVisibleChanged     guifg=gold
hi cppSTL                guifg=darkkhaki
hi Pmenu                 guifg=khaki guibg=DarkGrey
hi PmenuSel              gui=bold guifg=khaki guibg=olivedrab
hi SignColumn            guibg=grey30
hi ShowMarksHLl          guifg=white guibg=grey30 gui=bold
hi ShowMarksHLu          guifg=white guibg=grey30
hi ShowMarksHLo          guifg=grey60 guibg=grey30
hi ShowMarksHLm          guifg=grey60 guibg=grey30


hi Normal                ctermfg=White
"hi Cursor                ctermbg=khaki ctermfg=slategrey
"hi VertSplit             ctermbg=#c2bfa5 ctermfg=grey50 cterm=none
hi Folded                ctermbg=darkgrey ctermfg=3
"hi FoldColumn            ctermbg=grey30 ctermfg=tan
"hi IncSearch             ctermfg=slategrey ctermbg=khaki
"hi ModeMsg               ctermfg=goldenrod
"hi MoreMsg               ctermfg=SeaGreen
"hi NonText               ctermfg=LightBlue ctermbg=grey15
"hi Question              ctermfg=springgreen
"hi Search                ctermbg=peru ctermfg=wheat
"hi SpecialKey            ctermfg=red
"hi StatusLine            ctermbg=#c2bfa5 ctermfg=black cterm=none
"hi StatusLineNC          ctermbg=#c2bfa5 ctermfg=grey50 cterm=none
"hi Title                 ctermfg=indianred
"hi Visual                cterm=none ctermfg=khaki ctermbg=olivedrab
"hi MatchParen            cterm=bold ctermfg=white ctermbg=grey40
"hi WarningMsg            ctermfg=salmon
"hi WildMenu              ctermbg=khaki
"hi cursorline            ctermbg=grey15
hi Comment               ctermfg=darkgrey
hi Constant              cterm=bold ctermfg=1
hi Identifier            cterm=bold ctermfg=2
hi Statement             cterm=bold ctermfg=3
hi PreProc               ctermfg=1
hi Type                  cterm=bold ctermfg=3
"hi Special               ctermfg=navajowhite
"hi Ignore                ctermfg=grey40
"hi Todo                  ctermfg=orangered ctermbg=yellow2
hi MBENormal             cterm=bold ctermfg=0
hi link MBEChanged       Constant
hi MBEVisibleNormal      ctermfg=3 
hi MBEVisibleChanged     ctermfg=3
hi SignColumn            ctermbg=lightgray
hi ShowMarksHLl          ctermfg=white ctermbg=darkgrey
hi ShowMarksHLu          ctermfg=white ctermbg=darkgrey
hi ShowMarksHLo          ctermfg=lightgray ctermbg=darkgrey
hi ShowMarksHLm          ctermfg=lightgrey ctermbg=darkgrey


