;NSISdl include file for NSIS
;Written by deguix

;Supported languages with their translators in alphabetical order:

;English default language by Yaroslav Faybishenko and Justin Frankel

;Chinese, Simplified translation by Kii Ali <kiiali@cpatch.org>
;Chinese, Traditional translation by "matini" and Kii Ali <kiiali@cpatch.org>
;Croatian translation by Igor Ostriz
;German tranlation by Jan T. Sott
;Lithuanian translation by Vytautas Krivickas
;Portuguese, Brazilian translation by "deguix"

!ifndef NSISDL_USED

!define NSISDL_USED

  !ifdef LANG_ENGLISH

    LangString NSISDL_DOWNLOADING ${LANG_ENGLISH} "Downloading %s"
    LangString NSISDL_CONNECTING ${LANG_ENGLISH} "Connecting ..."
    LangString NSISDL_SECOND ${LANG_ENGLISH} "second"
    LangString NSISDL_MINUTE ${LANG_ENGLISH} "minute"
    LangString NSISDL_HOUR ${LANG_ENGLISH} "hour"
    LangString NSISDL_PLURAL ${LANG_ENGLISH} "s"
    LangString NSISDL_PROGRESS ${LANG_ENGLISH} "%dkB (%d%%) of %dkB @ %d.%01dkB/s"
    LangString NSISDL_REMAINING ${LANG_ENGLISH} "(%d %s%s remaining)"
    
  !endif
  
  !ifdef LANG_PORTUGUESEBR

    LangString NSISDL_DOWNLOADING ${LANG_PORTUGUESEBR} "Baixando %s"
    LangString NSISDL_CONNECTING ${LANG_PORTUGUESEBR} "Conectando ..."
    LangString NSISDL_SECOND ${LANG_PORTUGUESEBR} "segundo"
    LangString NSISDL_MINUTE ${LANG_PORTUGUESEBR} "minuto"
    LangString NSISDL_HOUR ${LANG_PORTUGUESEBR} "hora"
    LangString NSISDL_PLURAL ${LANG_PORTUGUESEBR} "s"
    LangString NSISDL_PROGRESS ${LANG_PORTUGUESEBR} "%dKb (%d%%) de %dKb em %d.%01dKb/s"
    LangString NSISDL_REMAINING ${LANG_PORTUGUESEBR} "(%d %s%s restando)"
    
  !endif

  !ifdef LANG_LITHUANIAN

    LangString NSISDL_DOWNLOADING ${LANG_LITHUANIAN} "Perkeliam %s"
    LangString NSISDL_CONNECTING ${LANG_LITHUANIAN} "Prisijungiam ..."
    LangString NSISDL_SECOND ${LANG_LITHUANIAN} "sekunde(s)"
    LangString NSISDL_MINUTE ${LANG_LITHUANIAN} "minute(s)"
    LangString NSISDL_HOUR ${LANG_LITHUANIAN} "valanda(os)"
    LangString NSISDL_PLURAL ${LANG_LITHUANIAN} ""
    LangString NSISDL_PROGRESS ${LANG_LITHUANIAN} "%dkB (%d%%) iš %dkB @ %d.%01dkB/s"
    LangString NSISDL_REMAINING ${LANG_LITHUANIAN} "(%d %s%s liko)"

  !endif

  !ifdef LANG_GERMAN

    LangString NSISDL_DOWNLOADING ${LANG_GERMAN} "Dateidownload: %s"
    LangString NSISDL_CONNECTING ${LANG_GERMAN} "Verbindung wird aufgebaut"
    LangString NSISDL_SECOND ${LANG_GERMAN} "Sekunde"
    LangString NSISDL_MINUTE ${LANG_GERMAN} "Minute"
    LangString NSISDL_HOUR ${LANG_GERMAN} "Stunde"
    LangString NSISDL_PLURAL ${LANG_GERMAN} "n"
    LangString NSISDL_PROGRESS ${LANG_GERMAN} "%dkB (%d%%) von %dkB @ %d.%01dkB/s"
    LangString NSISDL_REMAINING ${LANG_GERMAN} "(Verbleibende Zeit: %d %s%s)"

  !endif

  !ifdef LANG_TRADCHINESE

    LangString NSISDL_DOWNLOADING ${LANG_TRADCHINESE} "¥¿¦b¤U¸ü %s"
    LangString NSISDL_CONNECTING ${LANG_TRADCHINESE} "¥¿¦b³s½u ..."
    LangString NSISDL_SECOND ${LANG_TRADCHINESE} "¬í"
    LangString NSISDL_MINUTE ${LANG_TRADCHINESE} "¤À"
    LangString NSISDL_HOUR ${LANG_TRADCHINESE} "®É"
    LangString NSISDL_PLURAL ${LANG_TRADCHINESE} ""
    LangString NSISDL_PROGRESS ${LANG_TRADCHINESE} "%dkB (%d%%) / %dkB @ %d.%01dkB/s"
    LangString NSISDL_REMAINING ${LANG_TRADCHINESE} "(³Ñ¾l: %d %s%s )"
    
  !endif

  !ifdef LANG_SIMPCHINESE

    LangString NSISDL_DOWNLOADING ${LANG_SIMPCHINESE} "ÕýÔÚÏÂÔØ %s"
    LangString NSISDL_CONNECTING ${LANG_SIMPCHINESE} "ÕýÔÚÁ¬½Ó ..."
    LangString NSISDL_SECOND ${LANG_SIMPCHINESE} "Ãë"
    LangString NSISDL_MINUTE ${LANG_SIMPCHINESE} "·Ö"
    LangString NSISDL_HOUR ${LANG_SIMPCHINESE} "Ê±"
    LangString NSISDL_PLURAL ${LANG_SIMPCHINESE} ""
    LangString NSISDL_PROGRESS ${LANG_SIMPCHINESE} "%dkB (%d%%) / %dkB @ %d.%01dkB/s"
    LangString NSISDL_REMAINING ${LANG_SIMPCHINESE} "(Ê£Óà: %d %s%s )"
    
  !endif

  !ifdef LANG_CROATIAN

    LangString NSISDL_DOWNLOADING ${LANG_CROATIAN} "Preuzimanje %s"
    LangString NSISDL_CONNECTING ${LANG_CROATIAN} "Spajanje ..."
    LangString NSISDL_SECOND ${LANG_CROATIAN} "sekunde"
    LangString NSISDL_MINUTE ${LANG_CROATIAN} "minute"
    LangString NSISDL_HOUR ${LANG_CROATIAN} "sat"
    LangString NSISDL_PLURAL ${LANG_CROATIAN} "a"
    LangString NSISDL_PROGRESS ${LANG_CROATIAN} "%dkB (%d%%) od %dkB @ %d.%01dkB/s"
    LangString NSISDL_REMAINING ${LANG_CROATIAN} "(%d %s%s preostalo)"

  !endif

  !ifdef LANG_FRENCH

    LangString NSISDL_DOWNLOADING ${LANG_FRENCH} "Téléchargement de %s"
    LangString NSISDL_CONNECTING ${LANG_FRENCH} "Etablissement de la connection ..."
    LangString NSISDL_SECOND ${LANG_FRENCH} "seconde"
    LangString NSISDL_MINUTE ${LANG_FRENCH} "minute"
    LangString NSISDL_HOUR ${LANG_FRENCH} "heure"
    LangString NSISDL_PLURAL ${LANG_FRENCH} "s"
    LangString NSISDL_PROGRESS ${LANG_FRENCH} "%dkB (%d%%) de %dkB @ %d.%01dkB/s"
    LangString NSISDL_REMAINING ${LANG_FRENCH} "(temps restant: %d %s%s)"

  !endif

  !macro NSISDL_DOWNLOAD SOURCE DESTINATION

    SetDetailsPrint none

    CreateDirectory "${DESTINATION}"
    RMDir "${DESTINATION}"

    SetDetailsPrint both

    NSISDL::Download /TRANSLATE "$(NSISDL_DOWNLOADING)" "$(NSISDL_CONNECTING)" "$(NSISDL_SECOND)" "$(NSISDL_MINUTE)" "$(NSISDL_HOUR)" "$(NSISDL_PLURAL)" "$(NSISDL_PROGRESS)" " $(NSISDL_REMAINING)" "${SOURCE}" "${DESTINATION}"

  !macroend

  !macro NSISDL_DOWNLOAD_TIMEOUT SOURCE DESTINATION TIMEOUT

    SetDetailsPrint none

    CreateDirectory "${DESTINATION}"
    RMDir "${DESTINATION}"

    SetDetailsPrint both

    !define "TIMEOUT_${TIMEOUT}"

    Push $0
  
    !ifndef TIMEOUT_
    
      StrCpy $0 "/TIMEOUT=${TIMEOUT}"
    
    !else
  
      StrCpy $0 ""
    
    !endif

      NSISDL::Download /TRANSLATE "$(NSISDL_DOWNLOADING)" "$(NSISDL_CONNECTING)" "$(NSISDL_SECOND)" "$(NSISDL_MINUTE)" "$(NSISDL_HOUR)" "$(NSISDL_PLURAL)" "$(NSISDL_PROGRESS)" " $(NSISDL_REMAINING)" "$0" "${SOURCE}" "${DESTINATION}"
  
    Pop $0
  
    !undef "TIMEOUT_${TIMEOUT}"

  !macroend

  !macro NSISDL_DOWNLOAD_QUIET SOURCE DESTINATION

    SetDetailsPrint none

    CreateDirectory "${DESTINATION}"
    RMDir "${DESTINATION}"

    SetDetailsPrint both

    NSISDL::Download_Quiet "${SOURCE}" "${DESTINATION}"

  !macroend

  !macro NSISDL_DOWNLOAD_QUIET_TIMEOUT SOURCE DESTINATION TIMEOUT

    SetDetailsPrint none

    CreateDirectory "${DESTINATION}"
    RMDir "${DESTINATION}"

    SetDetailsPrint both

    !define "TIMEOUT_${TIMEOUT}"

    Push $0
  
    !ifndef TIMEOUT_
    
      StrCpy $0 "/TIMEOUT=${TIMEOUT}"
    
    !else
  
      StrCpy $0 ""
    
    !endif

      NSISDL::Download_Quiet "$0" "${SOURCE}" "${DESTINATION}"
  
    Pop $0
  
    !undef "TIMEOUT_${TIMEOUT}"

  !macroend

  !macro NSISDLSMOOTH_DOWNLOAD SOURCE DESTINATION

    SetDetailsPrint none

    CreateDirectory "${DESTINATION}"
    RMDir "${DESTINATION}"

    SetDetailsPrint both

    NSISDLSMOOTH::Download /TRANSLATE "$(NSISDL_DOWNLOADING)" "$(NSISDL_CONNECTING)" "$(NSISDL_SECOND)" "$(NSISDL_MINUTE)" "$(NSISDL_HOUR)" "$(NSISDL_PLURAL)" "$(NSISDL_PROGRESS)" " $(NSISDL_REMAINING)" "${SOURCE}" "${DESTINATION}"

  !macroend

  !macro NSISDLSMOOTH_DOWNLOAD_TIMEOUT SOURCE DESTINATION TIMEOUT

    SetDetailsPrint none

    CreateDirectory "${DESTINATION}"
    RMDir "${DESTINATION}"

    SetDetailsPrint both

    !define "TIMEOUT_${TIMEOUT}"

    Push $0
  
    !ifndef TIMEOUT_
    
      StrCpy $0 "/TIMEOUT=${TIMEOUT}"
    
    !else
  
      StrCpy $0 ""
    
    !endif

      NSISDLSMOOTH::Download /TRANSLATE "$(NSISDL_DOWNLOADING)" "$(NSISDL_CONNECTING)" "$(NSISDL_SECOND)" "$(NSISDL_MINUTE)" "$(NSISDL_HOUR)" "$(NSISDL_PLURAL)" "$(NSISDL_PROGRESS)" " $(NSISDL_REMAINING)" "$0" "${SOURCE}" "${DESTINATION}"
  
    Pop $0
  
    !undef "TIMEOUT_${TIMEOUT}"

  !macroend

  !macro NSISDLSMOOTH_DOWNLOAD_QUIET SOURCE DESTINATION

    SetDetailsPrint none

    CreateDirectory "${DESTINATION}"
    RMDir "${DESTINATION}"

    SetDetailsPrint both

    NSISDLSMOOTH::Download_Quiet "${SOURCE}" "${DESTINATION}"

  !macroend

  !macro NSISDLSMOOTH_DOWNLOAD_QUIET_TIMEOUT SOURCE DESTINATION TIMEOUT

    SetDetailsPrint none

    CreateDirectory "${DESTINATION}"
    RMDir "${DESTINATION}"

    SetDetailsPrint both

    !define "TIMEOUT_${TIMEOUT}"

    Push $0
  
    !ifndef TIMEOUT_
    
      StrCpy $0 "/TIMEOUT=${TIMEOUT}"
    
    !else
  
      StrCpy $0 ""
    
    !endif

      NSISDLSMOOTH::Download_Quiet "$0" "${SOURCE}" "${DESTINATION}"
  
    Pop $0
  
    !undef "TIMEOUT_${TIMEOUT}"

  !macroend

!endif
