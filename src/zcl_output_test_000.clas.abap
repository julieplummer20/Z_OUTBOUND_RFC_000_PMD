CLASS zcl_output_test_000 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_output_test_000 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    " ABAP source code for type definition for BAPI_EPM_PRODUCT_HEADER
    " generated on: ...

    TYPES : BEGIN OF ty_bapi_epm_product_header,
              productid     TYPE c LENGTH 10,
              typecode      TYPE c LENGTH 2,
              category      TYPE c LENGTH 40,
              name          TYPE c LENGTH 255,
              description   TYPE c LENGTH 255,
              supplierid    TYPE c LENGTH 10,
              suppliername  TYPE c LENGTH 80,
              taxtarifcode  TYPE int1,
              measureunit   TYPE c LENGTH 3,
              weightmeasure TYPE p LENGTH 7 DECIMALS 3,
              weightunit    TYPE c LENGTH 3,
              price         TYPE p LENGTH 12 DECIMALS 4,
              currencycode  TYPE c LENGTH 5,
              width         TYPE p LENGTH 7 DECIMALS 3,
              depth         TYPE p LENGTH 7 DECIMALS 3,
              height        TYPE p LENGTH 7 DECIMALS 3,
              dimunit       TYPE c LENGTH 3,
              productpicurl TYPE c LENGTH 255,
            END OF ty_bapi_epm_product_header.

    TRY.

        DATA(lo_destination) = cl_rfc_destination_provider=>create_by_comm_arrangement(
                            comm_scenario          = 'Z_OUTBOUND_RFC_000_CSCEN'     " Communication scenario
                            service_id             = 'Z_OUTBOUND_RFC_000_SRFC'       " Outbound service
                            comm_system_id         = 'Z_OUTBOUND_RFC_CSYS'    " Communication system

                            ).

        DATA(lv_destination) = lo_destination->get_destination_name( ).


        "variables needed to call BAPI

        DATA lt_product TYPE STANDARD TABLE OF  ty_bapi_epm_product_header.
        DATA ls_product TYPE ty_bapi_epm_product_header.
        DATA msg TYPE c LENGTH 255.

        "Exception handling is mandatory to avoid dumps
        CALL FUNCTION 'BAPI_EPM_PRODUCT_GET_LIST'
          DESTINATION lv_destination
          EXPORTING
            max_rows              = 25
          TABLES
            headerdata            = lt_product
          EXCEPTIONS
            system_failure        = 1 MESSAGE msg
            communication_failure = 2 MESSAGE msg
            OTHERS                = 3.

        CASE sy-subrc.
          WHEN 0.
            LOOP AT lt_product INTO ls_product.
              out->write( ls_product-name && ls_product-price && ls_product-currencycode ).
            ENDLOOP.
          WHEN 1.
            out->write( |EXCEPTION SYSTEM_FAILURE | && msg ).
          WHEN 2.
            out->write( |EXCEPTION COMMUNICATION_FAILURE | && msg ).
          WHEN 3.
            out->write( |EXCEPTION OTHERS| ).
        ENDCASE.

      CATCH cx_root INTO DATA(lx_root).
        out->write(  lx_root->get_longtext( ) ).

    ENDTRY.

  ENDMETHOD.
ENDCLASS.
