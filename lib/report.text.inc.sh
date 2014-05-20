###
# Librairies pour la gestion de rapport vide
# ==============================================================================
# @package olixsh
# @author Olivier
# @created 16/05/2014
##



###
# Affiche un message d'en-tête de niveau 2
# @param $1     : Message
# @param $2..$9 : Valeur à inclure dans le message
##
function report_printHead1()
{
	logger_debug "report_printHead1 ($@)"
	echo >> ${OLIX_REPORT_FILENAME}
    echo " $(printf "$@")" >> ${OLIX_REPORT_FILENAME}
    echo "===============================================================================" >> ${OLIX_REPORT_FILENAME}
}


###
# Affiche un message d'en-tête de niveau 2
# @param $1 : Message
# @param $2 : Valeur à inclure dans le message
##
function report_printHead2()
{
	logger_debug "report_printHead2 ($1, $2)"
	echo >> ${OLIX_REPORT_FILENAME}
    echo " $(printf "$1" "$2")" >> ${OLIX_REPORT_FILENAME}
    echo "-------------------------------------------------------------------------------" >> ${OLIX_REPORT_FILENAME}
}


###
# Afficher une ligne
##
function report_printLine()
{
    logger_debug "report_printLine ()"
    echo "-------------------------------------------------------------------------------" >> ${OLIX_REPORT_FILENAME}
}


###
# Affiche un message standard
# @param $1 : Message à afficher
##
function report_print()
{
    logger_debug "report_print ($1)"
    echo $1 >> ${OLIX_REPORT_FILENAME}
}


###
# Affiche le message d'information de retour d'un traitement
# @param $1 : Valeur de retour
# @param $2 : Message
# @param $3 : Message de retour
##
function report_printMessageReturn()
{
	logger_debug "report_printMessageReturn ($1, $2, $3)"
    echo -n $(stdout_strpad "$2" 64 "." " :") >> ${OLIX_REPORT_FILENAME}
    if [[ $1 -ne 0 ]]; then
        echo -n " ERROR" >> ${OLIX_REPORT_FILENAME}
    elif [[ -z $3 ]]; then
        echo -n " OK" >> ${OLIX_REPORT_FILENAME}
        [[ ! -z $4 ]] && echo " ($4s)" >> ${OLIX_REPORT_FILENAME} || echo  >> ${OLIX_REPORT_FILENAME}
    else
        echo -n " $3" >> ${OLIX_REPORT_FILENAME}
        [[ ! -z $4 ]] && echo " ($4s)" >> ${OLIX_REPORT_FILENAME} || echo  >> ${OLIX_REPORT_FILENAME}
    fi
    return $1
}


###
# Affiche le contenu d'un fichier
# @param $1 : Valeur de retour
# @param $2 : Nom du fichier
##
function report_printFile()
{
    logger_debug "report_printFile ($1, $2)"
    cat $2 >> ${OLIX_REPORT_FILENAME}
    return $1
}
