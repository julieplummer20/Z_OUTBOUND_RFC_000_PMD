" Create Comm artifacts in FLP

CLASS zcl_system_info_rfc_000 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

*    TYPES:
*      rfcproto TYPE c LENGTH 000003 ##TYPSHADOW .
*    TYPES:
*      rfcchartyp TYPE c LENGTH 000004 ##TYPSHADOW .
*    TYPES:
*      rfcinttyp TYPE c LENGTH 000003 ##TYPSHADOW .
*    TYPES:
*      rfcflotyp TYPE c LENGTH 000003 ##TYPSHADOW .
*    TYPES:
*      rfcdest TYPE c LENGTH 000032 ##TYPSHADOW .
*    TYPES:
*      rfcchar8 TYPE c LENGTH 000008 ##TYPSHADOW .
*    TYPES:
*      sysysid TYPE c LENGTH 000008 ##TYPSHADOW .
*    TYPES:
*      rfcdbhost TYPE c LENGTH 000032 ##TYPSHADOW .
*    TYPES:
*      sydbsys TYPE c LENGTH 000010 ##TYPSHADOW .
*    TYPES:
*      sysaprl TYPE c LENGTH 000004 ##TYPSHADOW .
*    TYPES:
*      rfcmach TYPE c LENGTH 000005 ##TYPSHADOW .
*    TYPES:
*      syopsys TYPE c LENGTH 000010 ##TYPSHADOW .
*    TYPES:
*      rfctzone TYPE c LENGTH 000006 ##TYPSHADOW .
*    TYPES:
*      sydayst TYPE c LENGTH 000001 ##TYPSHADOW .
*    TYPES:
*      rfcipaddr TYPE c LENGTH 000015 ##TYPSHADOW .
*    TYPES:
*      sykernrl TYPE c LENGTH 000004 ##TYPSHADOW .
*    TYPES:
*      syhost TYPE c LENGTH 000032 ##TYPSHADOW .
*    TYPES:
*      rfcsi_resv TYPE c LENGTH 000012 ##TYPSHADOW .
*    TYPES:
*      rfcipv6addr TYPE c LENGTH 000045 ##TYPSHADOW .
*    TYPES:
*      BEGIN OF rfcsi                         ,
*        rfcproto    TYPE rfcproto,
*        rfcchartyp  TYPE rfcchartyp,
*        rfcinttyp   TYPE rfcinttyp,
*        rfcflotyp   TYPE rfcflotyp,
*        rfcdest     TYPE rfcdest,
*        rfchost     TYPE rfcchar8,
*        rfcsysid    TYPE sysysid,
*        rfcdatabs   TYPE sysysid,
*        rfcdbhost   TYPE rfcdbhost,
*        rfcdbsys    TYPE sydbsys,
*        rfcsaprl    TYPE sysaprl,
*        rfcmach     TYPE rfcmach,
*        rfcopsys    TYPE syopsys,
*        rfctzone    TYPE rfctzone,
*        rfcdayst    TYPE sydayst,
*        rfcipaddr   TYPE rfcipaddr,
*        rfckernrl   TYPE sykernrl,
*        rfchost2    TYPE syhost,
*        rfcsi_resv  TYPE rfcsi_resv,
*        rfcipv6addr TYPE rfcipv6addr,
*      END OF rfcsi                          ##TYPSHADOW .


    INTERFACES: if_oo_adt_classrun,
               zif_system_information .

    ALIASES: rfcsi FOR  zif_system_information~rfcsi.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SYSTEM_INFO_RFC_000 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TRY.
        DATA(lo_destination) = cl_rfc_destination_provider=>create_by_comm_arrangement(

                                " Y11
*                              comm_scenario          = 'Z_OUTBOUND_RFC_000_CSCEN'   " Communication scenario
*                              service_id             = 'Z_OUTBOUND_RFC_000_SRFC'    " Outbound service
*                              comm_system_id         = 'Z_OUTBOUND_RFC_CSYS'    " Communication system

                                " PMD
                                comm_scenario          = 'Z_OUTBOUND_RFC_000_CSCEN'   " Communication scenario
                                service_id             = 'Z_OUTBOUND_RFC_000_SRFC'    " Outbound service
                                comm_system_id         = 'Z_OUTBOUND_RFC_CSYS'        " Communication system

                             ).

        DATA(lv_destination) = lo_destination->get_destination_name( ).

        DATA lv_result TYPE RFCSI.
        DATA msg TYPE c LENGTH 255.

        CALL FUNCTION 'RFC_SYSTEM_INFO'
          DESTINATION lv_destination
          IMPORTING
            rfcsi_export          = lv_result
          EXCEPTIONS
            system_failure        = 1 MESSAGE msg
            communication_failure = 2 MESSAGE msg
            OTHERS                = 3.

        CASE sy-subrc.
          WHEN 0.
            out->write( lv_result ).
          WHEN 1.
            out->write( | EXCEPTION SYSTEM_FAILURE | && msg ).
          WHEN 2.
            out->write( | EXCEPTION COMMUNICATION_FAILURE | && msg ).
          WHEN 3.
            out->write( | EXCEPTION OTHERS | ).
        ENDCASE.

      CATCH cx_root INTO DATA(lx_root).
        out->write( lx_root->get_text( ) ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
