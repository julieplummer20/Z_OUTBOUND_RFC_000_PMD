CLASS zcl_system_info_rfc_000 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_system_info_rfc_000 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
        TRY.
      DATA(lo_destination) = cl_rfc_destination_provider=>create_by_comm_arrangement(
                              comm_scenario          = 'Z_OUTBOUND_RFC_000_CSCEN'   " Communication scenario
                              service_id             = 'Z_OUTBOUND_RFC_000'         " Outbound service
                              comm_system_id         = 'Z_OUTBOUND_RFC_CSYS_000'    " Communication system

                           ).

      DATA(lv_destination) = lo_destination->get_destination_name( ).

      DATA lv_result type c length 200.

      CALL function 'RFC_SYSTEM_INFO'
      destination lv_destination
        IMPORTING
          RFCSI_EXPORT      = lv_result.

        out->write( lv_result ).
    catch cx_root into data(lx_root).
      out->write( lx_root->get_text( ) ).
    endtry.
  ENDMETHOD.
ENDCLASS.
