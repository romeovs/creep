#!/usr/bin/env sh

# Terminal code highlighter for Haskell
# To use this, just the text you want to highlight in.
#
# Example:
# echo "Just 5 >>= (\ x -> x+5)" | hhl.sh

GREEN=`echo '\033[92m'`
RED=`echo '\033[91m'`
CYAN=`echo '\033[96m'`
BLUE=`echo '\033[94m'`
YELLOW=`echo '\033[93m'`
PURPLE=`echo '\033[95m'`
BLACK=`echo '\033[90m'`
RESET=`echo '\033[0m'`


character="s/'[^' ]*'/$YELLOW&$RESET/g;"
comment="s/--.*$/$BLACK&$RESET/g;"
compose="s/ \. / ${RED}·$RESET /g;"
compose_operator="s/\(\.\)/(${RED}·$RESET)/g;"
double_colon="s/::/$RED&$RESET/g;"
double_right_arrow="s/=>/=⇒/g;"
double_right_arrow_tail="s/([^>])>=>/\1=⇒/g;"
double_right_arrow_double_tail="s/>>=>/=⇒/g;"
inlined="s/\`[^\`]*\`/$RED&$RESET/g;"
interactive="s/(^<[^>]*>|<interactive>)/$YELLOW&$RESET/g;"
keyword="s/where/$RED&$RESET/g;"
lambda="s/(^|[^'])\\\/\1λ/g;"
lambda2="s/\"([^\"]*)λ([^\"]*)\"/\"\1${GREEN}\\\\${GREEN}\2\"/g;"
lambda3="s/λ/${RED}&$RESET/g;"
keyword_line="s/^[\ ]*(instance|class|where|data|type|newtype)/$RED&$RESET/g;"
load_failed="s/^Failed, modules loaded:/$RED&$RESET/;"
load_done="s/done./$PURPLE&$RESET/g;"
monad_bind="s/>>=/=/g;"
monad_bind_rev="s/=<</=/g;"
no_instance="s/^\s*No instance/$RED&$RESET/g;"
operator="s/(\(| )([!$%&*+.\/<=>?@\\\^|-~:]*)(\)| )/\1$RED\2$RESET\3/g;"
arrow="s/(\(| )([=⇒-]*)(\)| )/\1$RED\2$RESET\3/g;"
right_arrow2="s/ ->/ ${RED}-→$RESET/g;"
right_arrow="s/->/-${RED}→$RESET/g;"
right_arrow_tail="s/([^>])>-/\1${RED}⤚-${RESET}/g;"
right_arrow_double_tail="s/>>-/${RED}⤜-${RESET}/g;"
left_arrow="s/<-/${RED}←${RESET}-/g;"
left_arrow2="s/<- /${RED}←-${RESET} /g;"
left_arrow_tail="s/-<([^<])/${RED}-⤙${RESET}\1/g;"
left_arrow_double_tail="s/-<</${RED}-⤛<${RESET}/g;"
string="s/\"[^\"]*\"/$GREEN&$RESET/g;"

sed -E "$character\
        $comment\
        $compose\
        $compose_operator\
        $double_colon\
        $double_right_arrow_tail\
        $double_right_arrow_double_tail\
        $double_right_arrow\
        $keyword\
        $keyword_line\
        $inlined\
        $interactive\
        $lambda\
        $lambda2\
        $lambda3\
        $left_arrow\
        $left_arrow2\
        $left_arrow_tail\
        $left_arrow_double_tail\
        $load_failed\
        $load_done\
        $monad_bind\
        $monad_bind_rev\
        $no_instance\
        $right_arrow2\
        $right_arrow\
        $right_arrow_tail\
        $right_arrow_double_tail\
        $string\
        $arrow\
        $operator"
