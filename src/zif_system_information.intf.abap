INTERFACE zif_system_information
  PUBLIC .
    TYPES:
      rfcproto TYPE c LENGTH 000003 ##TYPSHADOW .
    TYPES:
      rfcchartyp TYPE c LENGTH 000004 ##TYPSHADOW .
    TYPES:
      rfcinttyp TYPE c LENGTH 000003 ##TYPSHADOW .
    TYPES:
      rfcflotyp TYPE c LENGTH 000003 ##TYPSHADOW .
    TYPES:
      rfcdest TYPE c LENGTH 000032 ##TYPSHADOW .
    TYPES:
      rfcchar8 TYPE c LENGTH 000008 ##TYPSHADOW .
    TYPES:
      sysysid TYPE c LENGTH 000008 ##TYPSHADOW .
    TYPES:
      rfcdbhost TYPE c LENGTH 000032 ##TYPSHADOW .
    TYPES:
      sydbsys TYPE c LENGTH 000010 ##TYPSHADOW .
    TYPES:
      sysaprl TYPE c LENGTH 000004 ##TYPSHADOW .
    TYPES:
      rfcmach TYPE c LENGTH 000005 ##TYPSHADOW .
    TYPES:
      syopsys TYPE c LENGTH 000010 ##TYPSHADOW .
    TYPES:
      rfctzone TYPE c LENGTH 000006 ##TYPSHADOW .
    TYPES:
      sydayst TYPE c LENGTH 000001 ##TYPSHADOW .
    TYPES:
      rfcipaddr TYPE c LENGTH 000015 ##TYPSHADOW .
    TYPES:
      sykernrl TYPE c LENGTH 000004 ##TYPSHADOW .
    TYPES:
      syhost TYPE c LENGTH 000032 ##TYPSHADOW .
    TYPES:
      rfcsi_resv TYPE c LENGTH 000012 ##TYPSHADOW .
    TYPES:
      rfcipv6addr TYPE c LENGTH 000045 ##TYPSHADOW .
    TYPES:
      BEGIN OF rfcsi                         ,
        rfcproto    TYPE rfcproto,
        rfcchartyp  TYPE rfcchartyp,
        rfcinttyp   TYPE rfcinttyp,
        rfcflotyp   TYPE rfcflotyp,
        rfcdest     TYPE rfcdest,
        rfchost     TYPE rfcchar8,
        rfcsysid    TYPE sysysid,
        rfcdatabs   TYPE sysysid,
        rfcdbhost   TYPE rfcdbhost,
        rfcdbsys    TYPE sydbsys,
        rfcsaprl    TYPE sysaprl,
        rfcmach     TYPE rfcmach,
        rfcopsys    TYPE syopsys,
        rfctzone    TYPE rfctzone,
        rfcdayst    TYPE sydayst,
        rfcipaddr   TYPE rfcipaddr,
        rfckernrl   TYPE sykernrl,
        rfchost2    TYPE syhost,
        rfcsi_resv  TYPE rfcsi_resv,
        rfcipv6addr TYPE rfcipv6addr,
      END OF rfcsi                          ##TYPSHADOW .



ENDINTERFACE.
