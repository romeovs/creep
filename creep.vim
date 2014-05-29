" ~/.vim/ftplugin/haskell/creep.vim

" set correct conceal
set conceallevel=1
set concealcursor=nvi

" lambda's
syntax match hsLambda "\\" conceal cchar=λ

" function composition
syntax match hsCompose / \. /ms=s+1,me=e-1 conceal cchar=·

" ->
syn match MHArrow   /->/       contains=MHArrowM,MHArrowH
syn match MHArrowM  /-/        contained containedin=MHArrow conceal cchar=-
syn match MHArrowH  /-\@<=>/   contained containedin=MHArrow conceal cchar=→

" <-
syn match HMArrow   /<-/       contains=HMArrowM,HMArrowH
syn match HMArrowH  /</        contained containedin=HMArrow conceal cchar=←
syn match HMArrowM  /<\@<=-/   contained containedin=HMArrow conceal cchar=-

" =>
syn match DMHArrow   /=>/       contains=DMHArrowM,DMHArrowH
syn match DMHArrowM  /=/        contained containedin=DMHArrow conceal cchar==
syn match DMHArrowH  /=\@<=>/   contained containedin=DMHArrow conceal cchar=⇒

" -<
syn match MTArrow   /-</       contains=MTArrowT,MTArrowM
syn match MTArrowT  /-/        contained containedin=MTArrow conceal cchar=-
syn match MTArrowM  /-\@<=</   contained containedin=MTArrow conceal cchar=⤙

" -<<
syn match MTTArrow   /-<</         contains=MTTArrowT,MTTArrowM
syn match MTTArrowT  /-<</me=s+1   contained containedin=MTTArrow conceal cchar=-
syn match MTTArrowM  /-\@<=</      contained containedin=MTTArrow conceal cchar=⤛
syn match MTTArrowM  /\(-<\)\@<=</ contained containedin=MTTArrow conceal cchar=<

" >-
syn match TMArrow   />-/      contains=TMArrowT,TMArrowM
syn match TMArrowT  />/       contained containedin=TMArrow conceal cchar=⤚
syn match TMArrowM  />\@<=-/  contained containedin=TMArrow conceal cchar=-

 ">>-
syn match TTMArrow   />>-/     contains=TTMArrowT,TTMArrowM
syn match TTMArrowTT  />/      contained containedin=TTMArrow conceal cchar=
syn match TTMArrowT  />\@<=>/  contained containedin=TTMArrow conceal cchar=⤜
syn match TTMArrowM  />\@<=-/  contained containedin=TTMArrow conceal cchar=-

" These are by far not all arrow patterns one could come up with, so if you need
" another one and can't think of how to implement it, please contact me to ask
" for it! I'll try to create the syntax rules.

" Also if you have come up with some more patterns please contact me so I can
" include them in the list.
